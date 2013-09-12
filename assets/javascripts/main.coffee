$           = require 'jquery'
Ember       = require 'ember'
Templates   = require './templates'

App = Ember.Application.create()

App.Router.map ->
  @resource 'listing', path: '/'

App.ListingRoute = Ember.Route.extend
  model: ->
    Ember.$.getJSON('/issues').then (data) ->
      console.log data
      data

require './app/helpers/date'

App
