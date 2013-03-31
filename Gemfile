source 'http://rubygems.org'

gem 'rake',              '~> 10.0.3'

gem 'middleman',         '~> 3.0.12'

gem 'builder'
gem 'sitemap_generator'
gem 'coffee-script'
gem 'nokogiri'
gem 'redcarpet'
gem 'pygments.rb'

gem 'compass'
gem 'zurb-foundation',   '~> 4.0.5', require: false


group :development do
  gem 'heroku',       '2.26.6', :require => false
end

group :production do
  gem 'puma',         '~> 1.6.3'
  gem 'rack-contrib'
  gem 'rack-rewrite'
end

# FIXME: Need to set this up with Bundler groups correctly
gem 'heroku_san',   '3.0.2'
