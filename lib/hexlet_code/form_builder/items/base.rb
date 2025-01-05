# frozen_string_literal: true

module HexletCode
  class FormBuilder
    module Items
      class Base
        attr_reader :options

        def initialize(options = {})
          @options = options
        end

        def tag
          nil
        end

        def type
          nil
        end

        def content
          nil
        end

        def name
          options[:name]
        end

        def value
          options[:value]
        end

        def html_attributes
          options.except(:as).merge({ type: })
        end

        def label_needed?
          label_before? || label_after?
        end

        def label_before?
          false
        end

        def label_after?
          false
        end
      end
    end
  end
end
