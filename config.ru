#\ -p 9000
$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), 'app')))

require './config/env'
require 'app'

run ::Begin::Web::App
