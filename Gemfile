source 'https://rubygems.org'

gem 'rake',               '~> 10.0.3'

gem 'middleman'
gem 'middleman-livereload'
gem 'builder'
gem 'sitemap_generator'
gem 'coffee-script'
gem 'coffee-filter'
gem 'nokogiri'
gem 'redcarpet'
gem 'bourbon'

group :development do
  gem 'heroku',           '2.26.6', :require => false
end

group :production do
  gem 'puma',             '~> 1.6.3'
  gem 'rack-contrib'
  gem 'rack-rewrite'
end

# FIXME: Need to set this up with Bundler groups correctly
gem 'heroku_san',         '3.0.2'
