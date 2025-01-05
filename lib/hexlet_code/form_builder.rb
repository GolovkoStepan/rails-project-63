# frozen_string_literal: true

require_relative 'form_builder/item_builder'

module HexletCode
  class FormBuilder
    attr_reader :resource_object, :form_options, :form_elements

    def initialize(object, url: '#', method: 'post', **options)
      @resource_object = object
      @form_options    = { action: url, method: }.merge(options)
      @form_elements   = []
    end

    def input(name, **options)
      form_elements << ItemBuilder.build(
        { name:, value: value_from_resource_object(name) }.merge(options)
      )
    end

    def submit(value = nil, **options)
      form_elements << ItemBuilder.build(
        { value:, as: :submit }.merge(options)
      )
    end

    private

    def value_from_resource_object(field_name)
      resource_object.public_send(field_name)
    end
  end
end
