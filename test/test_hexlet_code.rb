# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for_function
    assert { HexletCode.form_for('user') == '<form action="#" method="post"></form>' }

    assert do
      expected = '<form action="#" method="post" class="hexlet-form"></form>'
      actual   = HexletCode.form_for('user', class: 'hexlet-form')

      expected == actual
    end

    assert do
      expected = '<form action="/profile" method="post" class="hexlet-form"></form>'
      actual   = HexletCode.form_for('user', url: '/profile', class: 'hexlet-form')

      expected == actual
    end
  end
end
