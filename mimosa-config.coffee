exports.config =
  modules: [
    "server"
    "browserify"
    "csslint"
    "jshint"
    "live-reload"
    "bower"
    "minify-js"
    "minify-css"
    "coffeescript"
    "ember-handlebars"
    "copy"
    "stylus"]
  template:
    wrapType: 'common'
    commonLibPath: 'ember'
  browserify:
    bundles:
      [
        entries: ['javascripts/main.js']
        outputFile: 'bundle.js'
      ]
    shims:
      jquery:
        path: 'javascripts/vendor/jquery/jquery'
        exports: '$'
      handlebars:
        path: 'javascripts/vendor/ember/handlebars'
        exports: 'Handlebars'
      ember:
        path: 'javascripts/vendor/ember/ember'
        exports: 'Ember'
        depends:
          handlebars: 'Handlebars'
          jquery: '$'
    aliases:
      moment: 'javascripts/vendor/momentjs/moment'
      lodash: 'javascripts/vendor/lodash'
      marked: 'javascripts/vendor/marked/marked'
    noParse:
      [
        'javascripts/vendor/jquery/jquery'
        'javascripts/vendor/ember/handlebars'
        'javascripts/vendor/ember/ember'
      ]