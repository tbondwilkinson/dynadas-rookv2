require('Rserve')

# get the port from environment (heroku)
port <- Sys.getenv('PORT')

# run Rserve in process
run.Rserve(debug = FALSE, port, args = NULL, config.file = "./rserve.conf")