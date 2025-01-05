# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'tag'

  class FormBuilder
    def initialize(object, url: '#', method: 'post', **options)
      @object  = object
      @options = { action: url, method: }.merge(options)
    end

    def build_html
      Tag.build('form', options)
    end

    private

    attr_reader :object, :options
  end
end
