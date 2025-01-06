# frozen_string_literal: true

module HexletCode
  class FormBuilder
    module Items
      class Textarea < Base
        DEFAULT_COLS = 20
        DEFAULT_ROWS = 40

        def tag
          'textarea'
        end

        def content
          options[:value]
        end

        def html_attributes
          super.except(:type, :value).tap do |attributes|
            attributes[:cols] ||= DEFAULT_COLS
            attributes[:rows] ||= DEFAULT_ROWS
          end
        end

        def label_before?
          true
        end
      end
    end
  end
end
