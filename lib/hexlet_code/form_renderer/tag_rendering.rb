# frozen_string_literal: true

module HexletCode
  class FormRenderer
    module TagRendering
      SINGLE_TAG_TEMPLATE = '<%<tag_name>s%<attributes>s>'
      PAIRED_TAG_TEMPLATE = '<%<tag_name>s%<attributes>s>%<content>s</%<tag_name>s>'

      SINGLE_TAGS = %w[br img input].freeze

      def render_tag(tag_name, attributes = {}, &)
        if SINGLE_TAGS.include?(tag_name)
          render_tag_by_template(SINGLE_TAG_TEMPLATE, tag_name, attributes, &)
        else
          render_tag_by_template(PAIRED_TAG_TEMPLATE, tag_name, attributes, &)
        end
      end

      private

      def render_tag_by_template(template, tag_name, attributes = {})
        format(
          template,
          tag_name: tag_name,
          attributes: attributes_to_string(attributes),
          content: (yield if block_given?)
        )
      end

      def attributes_to_string(attributes)
        attributes_str = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
        attributes_str.empty? ? '' : " #{attributes_str}"
      end
    end
  end
end
