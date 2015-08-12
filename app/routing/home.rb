module Begin::Web::Routing::Home
  def self.registered(app)
    app.get '/?' do
      erb :'home/index', locals: {
        windowTitle: 'Begin'
      }
    end
  end
end
