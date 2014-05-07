source 'https://rubygems.org'


group :development, :test do
#used in both test and development
  gem "rspec-rails", "~> 2.14.0" # adds rspec and other rspec related features
  gem "factory_girl_rails", "~> 4.2.1" #default fixtures for feeding test data into the test suite
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  gem "faker", "~> 1.1.2" #generates names, emails, and other placeholders
  gem "capybara", "~> 2.1.0" #makes it easy to simulate user interaction
  gem "database_cleaner", "~> 1.0.1" #makes sure each spec run with rake is on a clean slate
  gem "launchy", "~> 2.3.0" #opens browser on demand to show what the browser is rendering
  gem "selenium-webdriver", "~> 2.39.0" #will test javascript-based interactions unavailable to capybara
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
