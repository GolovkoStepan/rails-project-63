# frozen_string_literal: true

require_relative 'base'

module HexletCode
  class FormBuilder
    module Items
      class Submit < Base
        def tag
          'input'
        end

        def type
          'submit'
        end

        def value
          super || 'Save'
        end
      end
    end
  end
end
