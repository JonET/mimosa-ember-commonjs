require('coffee-script')
server = require("./server");
config = require("./config");
server.startServer(config, function(){});