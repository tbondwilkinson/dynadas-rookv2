require('Rserve')

# get the port allowed
Rserve(args="--no-save --gui-none --RS-conf ./rserve.conf")