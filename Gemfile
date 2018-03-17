source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass", "~> 3.3.6"
gem "coffee-rails", "~> 4.2"
gem "device_detector"
gem "draper", github: "drapergem/draper"
gem "hashids"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.5"
gem "redis", "~> 4.0"
gem "redis-namespace"
gem "redis-rack-cache"
gem "redis-rails"
gem "sass-rails", "~> 5.0"
gem "sorcery"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :test do
  gem "capybara", "~> 2.13"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 3.1"
end

group :development, :test do
  gem "awesome_print"
  gem "dotenv-rails", "~> 2.1", ">= 2.1.1"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "pry"
  gem "rspec-rails", "~> 3.5"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
