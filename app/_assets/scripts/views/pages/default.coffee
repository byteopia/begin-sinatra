Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'
$          = require 'jquery'

module.exports = Marionette.ItemView.extend
  el: 'body'
  template: false

  initialize: ->
    layout = new window.App.Views[ 'layout' ]
