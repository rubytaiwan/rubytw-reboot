source "https://rubygems.org"

ruby "2.2.3"

gem "rails", "4.2.4"
gem "pg"
gem "uglifier", ">= 1.3.0"
gem "sass-rails", "~> 5.0"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "rails_utils"
gem "http"

# slim, markdown
gem "slim-rails"
gem "kramdown"

# web server
gem "puma"
gem "rack-timeout"

# frontend
gem "bootstrap-sass", "~> 3.3.5"
gem "font-awesome-sass", "~> 4.4.0"

group :staging, :production do
  gem "rails_12factor"
end

group :development do
  gem "web-console", "~> 2.0"
  gem "spring"
  gem "spring-commands-rspec"
  gem "rubocop", "0.29.1", require: false
end

group :test do
  gem "shoulda-matchers", require: false
  gem "webmock"
  gem "capybara"
  gem "database_rewinder"
end

group :development, :test do
  gem "pry-rails"
  gem "pry-byebug"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "bullet"
  gem "quiet_assets"
  gem "better_errors"
  gem "binding_of_caller"
  gem "did_you_mean"
  gem "faker"
  gem "dotenv-rails"
end
