var path = require('path');
var config = {
  "watch": {
    "sourceDir": [
      "assets"
    ],
    "compiledDir": [
      "public"
    ],
    "javascriptDir": [
      "javascripts"
    ],
    "exclude": [],
    "throttle": 0,
    "interval": 100,
    "binaryInterval": 300,
    "usePolling": true,
    "excludeRegex": {},
    "compiledJavascriptDir": [
      "public",
      "javascripts"
    ]
  },
  "liveReload": {
    "enabled": false
  },
  "isOptimize": true,
  "server": {
    "defaultServer": {
      "enabled": false,
      "onePager": false
    },
    "path": [
      "server.coffee"
    ],
    "port": 3000,
    "base": "",
    "views": {
      "compileWith": "jade",
      "extension": "jade",
      "path": [
        "views"
      ]
    }
  }
}

var resolvePath = function (pathPieces) {
  var returnPath = __dirname;
  pathPieces.forEach(function(piece) {
    returnPath = path.join(returnPath, piece);
  })
  return returnPath;
}

if (config.watch) {
  config.watch.compiledDir = resolvePath(config.watch.compiledDir);
  config.watch.sourceDir = resolvePath(config.watch.sourceDir);
  config.watch.javascriptDir = resolvePath(config.watch.javascriptDir)
  config.watch.compiledJavascriptDir = resolvePath(config.watch.compiledJavascriptDir);
}

if (config.server) {
  if (config.server.path) {
    config.server.path = resolvePath(config.server.path);
  }

  if (config.server.views && config.server.views.path) {
    config.server.views.path = resolvePath(config.server.views.path);
  }
}

module.exports = config;