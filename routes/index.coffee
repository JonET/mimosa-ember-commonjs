https = require 'https'
url = require 'url'

exports.index = (config) ->

  options =
    reload:    config.liveReload.enabled
    optimize:  config.isOptimize ? false
    cachebust: if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''

  # In the event plain html pages are being used, need to
  # switch to different page for optimized view
  name = if config.isOptimize and config.server.views.html
    "index-optimize"
  else
    "layout"

  (req, res) -> res.render name, options

exports.issues = ->
  issues = null
  (req, res) ->
    res.set 'Content-Type', 'application/json'

    return res.send(issues) if issues?

    opts = url.parse 'https://api.github.com/repos/dbashford/mimosa/issues'
    opts.headers = 'User-Agent' : 'testBrowserify'

    https.get opts, (issuesRes) ->
      body = ''
      issuesRes.on 'data', (d) ->
        body += d
      issuesRes.on 'end', ->
        issues = body
        res.send issues
