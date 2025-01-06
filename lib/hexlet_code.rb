# frozen_string_literal: true

require 'zeitwerk'

Zeitwerk::Loader.for_gem.setup

module HexletCode
  def self.form_for(object, **options)
    form_builder = FormBuilder.new(object, **options)
    yield(form_builder) if block_given?

    FormRenderer.new(form_builder).render_html
  end
end
