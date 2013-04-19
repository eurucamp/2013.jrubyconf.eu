# Markdown engine
set :markdown_engine, :redcarpet

# Asset directories
set :css_dir,         'stylesheets'
set :js_dir,          'javascripts'
set :images_dir,      'images'

# Livereload
activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :gzip

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
