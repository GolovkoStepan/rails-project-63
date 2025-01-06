# frozen_string_literal: true

module HexletCode
  class FormRenderer
    include TagRendering
    extend Forwardable

    attr_reader :form_builder

    def_delegators :@form_builder, :form_options, :form_elements

    def initialize(form_builder)
      @form_builder = form_builder
    end

    def render_html
      render_tag('form', **form_options) do
        render_form_items if form_elements.any?
      end
    end

    private

    def render_form_items
      result = form_elements.map do |form_element|
        ItemRendering.new(form_element).render_html
      end.join("\n")

      ["\n", result, "\n"].join
    end
  end
end
