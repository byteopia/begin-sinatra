# @note this file is more of a configuration at this point
#   it can include routes, set options, and determine assets to serve
#   but it shouldn't really contain any logic.
require 'helpers'
require 'assets'
require 'routing'

module Begin
  module Web
    class App < Sinatra::Base
      # @todo load cookie secret from config
      use Rack::Session::Cookie, secret: ENV['COOKIE_SECRET'], key: 'begin.session'

      set :server,          'puma'
      set :port,            ENV['PORT'].to_i
      set :root,            './app'

      register Sinatra::Flash
      register Sinatra::AssetPack
      register Begin::Web::Routing::Home

      helpers do
        include Begin::Web::Helpers
      end
      extend    Begin::Web::Assets
    end
  end
end
