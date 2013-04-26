require 'bundler/setup'
require 'psych'
require 'yaml'
require 'heroku_san'

namespace :assets do
  task :precompile do
    sh 'middleman build'
  end
end

module HerokuSan::Deploy
  class JRubyConf < Sinatra
    def deploy
      super
      #@stage.rake('utils:update_sitemap')
      #@stage.rake('utils:update_attendees')
    end
  end
end

config_file = File.join(File.expand_path(File.dirname(__FILE__)), 'config', 'heroku.yml')
HerokuSan.project = HerokuSan::Project.new(config_file, :deploy => HerokuSan::Deploy::JRubyConf)

load 'heroku_san/tasks.rb'

require 'nokogiri'
require 'open-uri'
require 'yaml'
require 'sitemap_generator'

namespace :utils do

  desc "Update attendees list with data from Lanyrd.com"
  task :update_attendees do
    data = lanyrd_attendees.to_yaml
    File.open('data/attendees.yml', 'w') {|f| f.write(data) }
  end

  desc "Update sitemap"
  task :update_sitemap do
    SitemapGenerator::Sitemap.default_host = 'http://2013.jrubyconf.eu'
    SitemapGenerator::Sitemap.public_path = "source"
    SitemapGenerator::Sitemap.create do
      add '/',           :changefreq => 'hourly'
      add '/policies',   :changefreq => 'weekly'
      add '/imprint',    :changefreq => 'weekly'
      #add '/schedule',   :changefreq => 'daily', :priority => 0.8
      #add '/venue',      :changefreq => 'daily'
      #add '/sponsors',   :changefreq => 'daily'

    end
    SitemapGenerator::Sitemap.ping_search_engines
  end

  # scrapes eurucamp page on lanyrd.com and returns
  # array of Twitter names
  def lanyrd_attendees
    profile_selector     = '.primary .mini-profile .name a'.freeze
    pagination_selector  = '.pagination li a'.freeze
    base_url             = 'http://lanyrd.com'.freeze
    first_page_path      = '/2013/jrubyconf/attendees/'.freeze

    first_page           = Nokogiri::HTML(open(base_url + first_page_path))
    other_pages_paths    = first_page.css(pagination_selector).map { |a| a[:href] }

    (other_pages_paths << first_page_path).map do |relative_path|
      page = Nokogiri::HTML(open(base_url + relative_path))
      page.css(profile_selector).map {|a| a['href'].gsub(/^\/profile\/|\/$/,'') }
    end.flatten.sort
  end
end
