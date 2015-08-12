module Begin
  module Web
    module Assets
      def self.extended(base)
        base.assets do
          serve '/js',               from: 'public/js'
          serve '/css',              from: 'public/css'
          serve '/fonts',            from: 'public/fonts'
          serve '/images',           from: 'public/images'
          serve '/bower_components', from: '../bower_components'
          serve '/node_modules',     from: '../node_modules'

          js :application, [
            "/node_modules/magnific-popup/dist/jquery.magnific-popup.min.js",
            "/js/app.js"
          ]

          css :application, [
            "/bower_components/ionicons/css/ionicons.min.css",
            "/node_modules/magnific-popup/dist/magnific-popup.css",
            "/css/app.css"
          ]
        end
      end
    end
  end
end
