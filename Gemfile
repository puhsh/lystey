source 'https://rubygems.org'

# Rails
gem 'rails', '4.2.1'

# Databases / Data-stores
gem 'pg'

# Assets and Asset-related items
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'

# Capistrano and Capistrano-related items
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano-rvm'
gem 'capistrano3-unicorn'

# Asset Packages via rails-assets.org
source 'https://rails-assets.org' do
  gem 'rails-assets-lodash', '3.6.0'
  gem 'rails-assets-immutable', '3.7.2'
  gem 'rails-assets-semantic', '1.12.1'
end

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
