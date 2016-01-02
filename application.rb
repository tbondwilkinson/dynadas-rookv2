require 'json'
require 'rserve'
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

system "R -f rserve.r"

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

  r = Rserve::Connection.new
  r.void_eval <<-EOF
cat <- new("CATsurv")
json_cat <- fromJSON('#{data.to_json}')
cat@guessing <- json_cat$guessing
cat@discrimination <- unlist(json_cat$discrimination)
cat@answers <- as.numeric(json_cat$answers)
cat@priorName <- json_cat$priorName
cat@priorParams <- json_cat$priorParams
cat@lowerBound <- json_cat$lowerBound
cat@upperBound <- json_cat$upperBound
cat@quadPoints <- json_cat$quadPoints
cat@D <- json_cat$D
cat@X <- json_cat$X
if (json_cat$poly) {
  cat@difficulty <- lapply(json_cat$difficulty, unlist)
  cat@poly <- TRUE
} else {
  cat@difficulty <- json_cat$difficulty
  cat@poly <- FALSE
}
cat@integration <- json_cat$integration
cat@estimation <- json_cat$estimation
cat@selection <- json_cat$selection
cat@coverage <- json_cat$coverage
cat@points <- json_cat$points
response <- nextItem(cat)
next_item = response$next.item
epvs = response$all.estimates$EPV
EOF

  next_item = r.eval("next_item").to_ruby
  epvs = r.eval("epvs").to_ruby
  JSONP Hash["next_item" => next_item, "epvs" => epvs]
end

post '/look_ahead' do
  request.body.rewind
  data = JSON.parse request.body.read
  cat = data["cat"]
  this_item = data["this_item"]

  r = Rserve::Connection.new
  r.void_eval <<-EOF
cat <- new("CATsurv")
json_cat <- fromJSON('#{cat.to_json}')
cat@guessing <- json_cat$guessing
cat@discrimination <- unlist(json_cat$discrimination)
cat@answers <- as.numeric(json_cat$answers)
cat@priorName <- json_cat$priorName
cat@priorParams <- json_cat$priorParams
cat@lowerBound <- json_cat$lowerBound
cat@upperBound <- json_cat$upperBound
cat@quadPoints <- json_cat$quadPoints
cat@D <- json_cat$D
cat@X <- json_cat$X
if (json_cat$poly) {
  cat@difficulty <- lapply(json_cat$difficulty, unlist)
  cat@poly <- TRUE
} else {
  cat@difficulty <- json_cat$difficulty
  cat@poly <- FALSE
}
cat@integration <- json_cat$integration
cat@estimation <- json_cat$estimation
cat@selection <- json_cat$selection
cat@coverage <- json_cat$coverage
cat@points <- json_cat$points
response <- lookAheadEPVcpp(cat, #{this_item})
next_items = response$next.items
EOF

  next_items = r.eval("next_items").to_ruby
  JSONP Hash["next_items" => next_items]
end
