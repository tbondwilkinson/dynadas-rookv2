require 'sinatra'
require 'rinruby'

# root page
get '/' do

  sample_size = 10

  html = "<html>"
  html += "<head><title>R Code Test</title></head>"
  html += "<body>"

  html += "<p>Running R code...</p>"

  begin

    R.eval "x <- rnorm(#{sample_size})"
    R.eval "summary(x)"
    R.eval "sd(x)"
    html += R.eval "print('Hello World from R')"
    R.eval "library(CATPack)"

    html += "<p>Suceeded running R code...</p>"

  rescue
    html += "<p>Failed running R code...</p>"
  ensure
    R.quit
  end

  html += "</html>"

end