Backbone   = require 'backbone'
Marionette = require 'backbone.marionette'
$          = require 'jquery'

module.exports = Marionette.ItemView.extend
  template: false
  initialize: ->
    console.log 'default layout'
