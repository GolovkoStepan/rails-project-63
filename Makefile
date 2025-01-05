.PHONY: install
install:
	bundle install

.PHONY: lint
lint:
	bundle exec rubocop

.PHONY: test
test:
	bundle exec rake test
