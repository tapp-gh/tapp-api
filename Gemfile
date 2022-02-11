source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'simplecov', require: false
  gem 'shoulda-matchers', require: false
  gem 'simplecov-console', require: false
  gem 'database_cleaner-active_record'
  gem 'jsonapi-rspec'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end

gem 'jwt'
gem 'bcrypt'