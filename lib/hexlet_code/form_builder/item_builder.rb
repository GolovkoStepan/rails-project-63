# frozen_string_literal: true

require_relative 'items/input'
require_relative 'items/textarea'
require_relative 'items/submit'

module HexletCode
  class FormBuilder
    class ItemBuilder
      MAPPINGS = {
        default: Items::Input,
        text: Items::Textarea,
        submit: Items::Submit
      }.freeze

      def self.build(options = {})
        MAPPINGS[options[:as] || :default].new(options)
      end
    end
  end
end
