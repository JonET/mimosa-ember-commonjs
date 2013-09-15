$           = require 'jquery'
Ember       = require 'ember'
Templates   = require './templates'
_           = require 'lodash'
Issues      = require './app/models/issues'
require './app/helpers/date'

App = Ember.Application.create()

App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'listing', path: '/'
  @resource 'issue', path: '/:number'

issues = Issues.create()
App.ListingRoute = Ember.Route.extend
  model: -> issues.loadIssues()

App.IssueRoute = Ember.Route.extend
  model: (args) ->
    issues.loadIssues().then (i) ->
      i.findBy "number", Number(args.number)

App
