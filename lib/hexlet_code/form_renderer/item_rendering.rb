# frozen_string_literal: true

module HexletCode
  class FormRenderer
    class ItemRendering
      include TagRendering
      extend Forwardable

      attr_reader :form_element

      def_delegators :@form_element, :label_before?, :label_after?, :name, :tag, :html_attributes, :content

      def initialize(form_element)
        @form_element = form_element
      end

      def render_html
        [
          (with_indent(label) if label_before?),
          with_indent(field),
          (with_indent(label) if label_after?)
        ].compact.join("\n")
      end

      private

      def label
        render_tag('label', for: name) { name.capitalize }
      end

      def field
        render_tag(tag, **html_attributes) { content }
      end

      def with_indent(str, spacers_count = 2)
        str.insert(0, ' ' * spacers_count)
      end
    end
  end
end
