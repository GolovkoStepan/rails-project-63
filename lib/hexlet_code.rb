# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_renderer'

module HexletCode
  def self.form_for(object, **options)
    form_builder = FormBuilder.new(object, **options)
    yield(form_builder) if block_given?

    FormRenderer.new(form_builder).render_html
  end
end
