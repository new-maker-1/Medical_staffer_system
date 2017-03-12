source 'https://rubygems.org'
ruby '2.2.6'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'pg', :group => :production
gem 'mysql2' , :group => :development
gem 'sqlite3', :group => :test

gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'
gem 'diffy'
group :development, :test do
  gem 'byebug', platform: :mri
end
group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap-sass'
gem 'devise'
gem 'high_voltage'
gem 'pundit'

group :development do
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'

  gem 'bcrypt', '~> 3.1.10', require: false
  if Bundler::WINDOWS
    gem 'bcrypt-ruby', '~> 3.0.0', require: false
  else
    gem 'bcrypt', '~> 3.1.10', require: false
  end
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

#gem 'bcrypt', :group => :production
gem 'rubyzip',  "~> 0.9.9"
gem "binding_of_caller"
gem 'paper_trail'
gem 'simple_form'
gem 'axlsx_rails'
gem 'roo'