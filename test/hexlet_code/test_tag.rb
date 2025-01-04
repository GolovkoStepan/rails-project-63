# frozen_string_literal: true

require 'test_helper'

class TestHexletCodeTag < Minitest::Test
  def test_br_tag
    assert { HexletCode::Tag.build('br') == '<br>' }
    assert { HexletCode::Tag.build('br', class: 'py-2') == '<br class="py-2">' }
  end

  def test_img_tag
    assert { HexletCode::Tag.build('img') == '<img>' }
    assert { HexletCode::Tag.build('img', class: 'py-2') == '<img class="py-2">' }
  end

  def test_input_tag
    assert { HexletCode::Tag.build('input') == '<input>' }
    assert { HexletCode::Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">' }
  end

  def test_label_tag
    assert { HexletCode::Tag.build('label') == '<label></label>' }
    assert { HexletCode::Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>' }
  end

  def test_div_tag
    assert { HexletCode::Tag.build('div') == '<div></div>' }
    assert { HexletCode::Tag.build('div') { 'Text' } == '<div>Text</div>' }
    assert { HexletCode::Tag.build('div', class: 'py-2') == '<div class="py-2"></div>' }
  end
end
