# frozen_string_literal: true

module HexletCode
  class FormRenderer
    module TagRendering
      TAGS_TEMPLATES = {
        br: '<br%<attributes>s>',
        img: '<img%<attributes>s>',
        input: '<input%<attributes>s>',
        label: '<label%<attributes>s>%<content>s</label>',
        div: '<div%<attributes>s>%<content>s</div>',
        form: '<form%<attributes>s>%<content>s</form>',
        textarea: '<textarea%<attributes>s>%<content>s</textarea>'
      }.freeze

      def render_tag(tag_name, attributes = {})
        attributes_str = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
        attributes_str = attributes_str.empty? ? '' : " #{attributes_str}"

        format(
          TAGS_TEMPLATES[tag_name.to_sym],
          attributes: attributes_str,
          content: (yield if block_given?)
        )
      end
    end
  end
end
