# frozen_string_literal: true

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
