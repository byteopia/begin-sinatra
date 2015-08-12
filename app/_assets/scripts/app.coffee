$          = require 'jquery'
Backbone   = require 'backbone'
Backbone.$ = $
Marionette = require 'backbone.marionette'

# custom renderer
Marionette.Renderer.render = (template, data) ->
  template.render data

window.App = new Marionette.Application()

# gather all of our views
App.on 'start', =>
  App.Views = require 'views/views.coffee'

# start history
App.on 'start', =>
  App.Router = require 'routers/default.coffee'

  Backbone.history.start pushState: true

$ ->
  App.start()
