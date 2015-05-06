require 'json'
require 'sinatra'
require 'sinatra/jsonp'
require 'sinatra/cross_origin'

r = RinRuby.new(:echo=>false)

set :allow_origin, :any
set :allow_methods, [:get, :post, :options]
set :allow_credentials, true
set :max_age, "1728000"
set :expose_headers, ['Content-Type']

configure do
  enable :cross_origin
end

# root page
get '/' do
  sample_size = 10

  html = "<html>"
  html += "<head><title>Cat API</title></head>"
  html += "<body>"

  html += "<p>Use /next_question with json parameters</p>"

  html += "</html>"

  html
end

post '/next_question' do
  request.body.rewind
  data = JSON.parse request.body.read

  File.open("#{RAILS_ROOT}/tmp/data_#{Process.pid}.json", 'w') { |file|
    file.write(data.to_json)
  }

  system("Rscript #{RAILS_ROOT}/cat_script.R #{RAILS_ROOT}/tmp/data_#{Process.pid}.json #{RAILS_ROOT}/tmp/out_#{Process.pid}.json")

  JSONP JSON.parse File.read "#{RAILS_ROOT}/tmp/out_#{Process.pid}.json"
end