# frozen_string_literal: true

module HexletCode
  class FormBuilder
    module Items
      class Input < Base
        def tag
          'input'
        end

        def type
          'text'
        end

        def label_before?
          true
        end
      end
    end
  end
end
