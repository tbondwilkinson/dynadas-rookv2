require 'json'
require 'sinatra'
require 'sinatra/jsonp'
require 'sinatra/cross_origin'

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

  File.open("#{settings.root}/tmp/data_#{Process.pid}.json", 'w') { |file|
    file.write(data.to_json)
  }

  system("Rscript #{settings.root}/cat_script.R #{settings.root}/tmp/data_#{Process.pid}.json #{settings.root}/tmp/out_#{Process.pid}.json")

  JSONP JSON.parse File.read "#{settings.root}/tmp/out_#{Process.pid}.json"
end