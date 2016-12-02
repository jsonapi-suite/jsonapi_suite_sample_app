source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'jsonapi_suite', '~> 0.1'
gem 'kaminari', '~> 0.17'

gem 'jsonapi-rb', path: '../jsonapi-rb'
gem 'jsonapi-rails', path: '../jsonapi-rails', require: 'jsonapi/rails'
gem 'jsonapi_compliable', path: '../jsonapi_compliable'
gem 'jsonapi-serializable', path: '../serializable'
gem 'jsonapi-deserializable', path: '../jsonapi-deserializable'
gem 'jsonapi-parser', path: '../jsonapi-parser'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'database_cleaner', '~> 1.5'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
