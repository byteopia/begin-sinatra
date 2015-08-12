ENV['ENV'] ||= 'development'

require 'rubygems'
require 'sinatra/assetpack'
require 'sinatra/flash'

ENV['RACK_ENV'] ||= ENV['ENV']
ENV['PORT'] ||= '9000'
