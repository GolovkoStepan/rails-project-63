# frozen_string_literal: true

module HexletCode
  module Tag
    TAGS_TEMPLATES = {
      br: '<br%<attributes>s>',
      img: '<img%<attributes>s>',
      input: '<input%<attributes>s>',
      label: '<label%<attributes>s>%<content>s</label>',
      div: '<div%<attributes>s>%<content>s</div>'
    }.freeze

    module_function

    def build(tag_name, attributes = {})
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
