# frozen_string_literal: true

module HexletCode
  autoload :VERSION, 'hexlet_code/version'
  autoload :FormBuilder, 'hexlet_code/form_builder'

  def self.form_for(object, **options)
    builder = FormBuilder.new(object, **options)
    yield(builder) if block_given?

    builder.build_html
  end
end
