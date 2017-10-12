source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'raygun4ruby'

gem 'rails', '~> 5.1.2'

gem 'pg', '~> 0.18'
gem 'activerecord-postgis-adapter'

gem 'puma', '~> 3.0'
gem 'hashie'

gem 'statesman'

# API 
gem 'jbuilder'
gem 'apipie-rails'
gem 'kaminari'

# Authentication and permission
gem 'knock'

# Provide config variable
gem 'figaro'

# QR code
gem 'rqrcode'

# Validation
gem 'validates_email_format_of'

# Email
gem 'premailer-rails'
gem 'sass-rails'
gem 'uglifier'

# user use those to seed staging
gem 'factory_girl_rails'
gem 'faker'

group :development, :test do
  gem 'capistrano3-puma'
  gem 'capistrano3-delayed-job', '~> 1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'pry-rails'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-rails', '~> 1.3'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Notifications
gem 'houston'
gem 'gcm'
