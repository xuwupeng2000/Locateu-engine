source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
gem 'activerecord-postgis-adapter'
gem 'rgeo'
gem 'puma', '~> 3.0'
gem 'hashie'
gem 'jsonapi-rails'
gem 'knock'
gem 'figaro'
gem 'rqrcode'
gem 'validates_email_format_of'
gem 'premailer-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'factory_girl_rails'
gem 'faker'

group :development, :test do
  gem 'pry-rails'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
