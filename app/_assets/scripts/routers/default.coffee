Marionette = require 'backbone.marionette'

Controller = 
  doDefault: ->
    new window.App.Views[ 'pages/default' ]

module.exports = new Marionette.AppRouter
  controller: Controller
  appRoutes:
    "(/)":                                     "doDefault"
