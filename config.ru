#use Rack::Auth::Basic, "Restricted Area" do |username, password|
#  [username, password] == ['eurucamp', 'eurucamp']
#end

use Rack::Static, :urls => ["/css", "/images", "/js", "/fonts"]
map "/hackdays" do
  run Rack::File.new("hackfest.html")
end
run Rack::File.new("index.html")
