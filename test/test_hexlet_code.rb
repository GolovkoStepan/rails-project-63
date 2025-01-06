# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :bio, keyword_init: true)

  def setup
    @user = User.new(name: 'Ivan', bio: 'hexlet')

    @clear_form       = read_fixture('clear_form.html')
    @form_with_attrs  = read_fixture('form_with_attrs.html')
    @form_with_inputs = read_fixture('form_with_inputs.html')
  end

  def test_that_it_has_a_version_number
    refute_nil HexletCode::VERSION
  end

  def test_clear_form
    form_html = HexletCode.form_for(@user)

    assert { form_html == @clear_form }
  end

  def test_form_with_attrs
    form_html = HexletCode.form_for(@user, url: '/profile', method: :get)

    assert { form_html == @form_with_attrs }
  end

  def test_form_with_inputs
    form_html = HexletCode.form_for(@user, url: '/profile', class: 'form') do |f|
      f.input :name, class: 'form-field'
      f.input :bio, as: :text, class: 'text', cols: 25
      f.submit class: 'submit'
    end

    assert { form_html == @form_with_inputs }
  end

  private

  def read_fixture(filename)
    File.read(
      File.expand_path("fixtures/#{filename}", __dir__)
    )
  end
end
