source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'activerecord-postgis-adapter'
gem 'factory_girl_rails'
gem 'faker'
gem 'figaro'
gem 'hashie'
gem 'jsonapi-rails'
gem 'knock'
gem 'pg', '~> 0.18'
gem 'premailer-rails'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1.2'
gem 'rgeo'
gem 'rqrcode'
gem 'sass-rails'
gem 'uglifier'
gem 'validates_email_format_of'

group :development, :test do
  gem 'database_cleaner'
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
