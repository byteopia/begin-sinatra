$          = require 'jquery'
Backbone   = require 'backbone'
Backbone.$ = $
Marionette = require 'backbone.marionette'

# custom renderer
Marionette.Renderer.render = (template, data) ->
  template.render data

window.App = new Marionette.Application()

App.on 'start', =>
  Backbone.history.start pushState: true
  
  console.log 'Running...'

$ ->
  App.start()
