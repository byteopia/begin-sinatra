ENV['ENV'] ||= 'development'
ENV['RACK_ENV'] ||= ENV['ENV']

require 'bundler'
Bundler.require :default, ENV['ENV'].to_sym

config_file '../config.yml'

assets do
  serve '/js',               from: 'public/js'
  serve '/css',              from: 'public/css'
  serve '/fonts',            from: 'public/fonts'
  serve '/bower_components', from: '../bower_components'

  js :application, [
    '/js/app.js'
  ]

  css :application, [
    '/bower_components/ionicons/css/ionicons.min.css',
    '/css/app.css'
  ]
end

get '/' do
  erb :'home/home'
end
