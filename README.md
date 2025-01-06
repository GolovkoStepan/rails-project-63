[![Actions Status](https://github.com/GolovkoStepan/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/GolovkoStepan/rails-project-63/actions)

# HexletCode

Библиотека для генерации html форм.

## Установка

Выполните следующие команды:

```bash
bundle add hexlet_code
bundle install
```

## Пример использования

```ruby
User = Struct.new(:name, :bio, keyword_init: true)

@user = User.new(name: 'Ivan', bio: 'hexlet')

HexletCode.form_for(@user, url: '/profile', class: 'form') do |f|
  f.input :name, class: 'form-field'
  f.input :bio, as: :text, class: 'text', cols: 25
  f.submit 'Save', class: 'submit'
end
```

```html
<form action="/profile" method="post" class="form">
  <label for="name">Name</label>
  <input name="name" value="Ivan" class="form-field" type="text">
  <label for="bio">Bio</label>
  <textarea name="bio" class="text" cols="25" rows="40">hexlet</textarea>
  <input value="Save" class="submit" type="submit">
</form>
```

## Описание команд Makefile

Установка зависимостей:
```bash
make install
```

Запуск проверок кода rubocop:
```bash
make lint
```

Запуск тестов:
```bash
make test
```
