# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.6.0'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'
# Use postgresql as the database for Active Record
# Use Puma as the app server
gem 'mysql2'
gem 'puma', '~> 4.3', '>= 4.3.3'
# gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'sassc', '~> 2.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# gem 'mini_racer'
# gem 'autoprefixer-rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
end

# group :production do
#   gem 'pg'
# end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'devise'
gem 'font-awesome-rails'
gem 'gretel'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# gem 'boostrap-sass', '~> 0.0.2'
gem 'activerecord-suppress_range_error', '~> 0.1.1'
gem 'apexcharts'
gem 'bootstrap', '~> 4.3.1'
gem 'bootstrap-kaminari-views'
gem 'carrierwave'
gem 'chartkick'
gem 'faker'
gem 'groupdate'
gem 'hiera-eyaml'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick', '~> 4.10', '>= 4.10.1'
gem 'paperclip'
gem 'pdfkit', '~> 0.8.4.1'
gem 'prawn', '~> 2.0', '>= 2.0.2'
gem 'prawn-qrcode', '~> 0.3.0'
gem 'prawn-table', '~> 0.2.2'
gem 'rails_admin'
gem 'rolify', '~> 5.2'
gem 'rubocop', require: false
gem 'sidekiq'
gem 'simple_form'
gem 'table_print'
gem 'truncate_html'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'yarn', '~> 0.1.1'
