source 'https://rubygems.org'

# Rails
gem 'rails', '4.2.1'

# Databases / Data-stores
gem 'pg'

# Assets and Asset-related items
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'less-rails'
gem "bower-rails", "~> 0.9.2"

# Capistrano and Capistrano-related items
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano-rvm'
gem 'capistrano3-unicorn'

# JS-runtime
gem 'therubyracer', platforms: :ruby

# Environment Specific
group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry-rails'
  gem 'rename'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers'
end

group :production do
  gem 'unicorn'
end

# Third Party
gem 'enumerize'
