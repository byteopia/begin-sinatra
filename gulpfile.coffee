browserify  = require 'gulp-browserify'

gulp        = require 'gulp'
plumber     = require 'gulp-plumber'
del         = require 'del'

# assets 
concat      = require 'gulp-concat'
watch       = require 'gulp-watch'
sass        = require 'gulp-ruby-sass'
cssGlobbing = require 'gulp-css-globbing'
bowerFiles  = require 'main-bower-files'

config =
  app:         "./app"
  views:       "./app/_views"
  assets:
    styles:    "./app/_assets/styles" 
    scripts:   "./app/_assets/scripts"
  public:
    styles:    "./app/public/css" 
    scripts:   "./app/public/js"
    fonts:     "./app/public/fonts"
    

# styles
gulp.task 'styles', ->
  bscss = bowerFiles([['**/*.css']])

  sass "#{config.assets.styles}/app.scss",
    require: [ 'sass-globbing', 'susy' ]
    loadPath: [ bscss, config.assets.styles ]
  .pipe plumber()
  .pipe gulp.dest( config.public.styles )


## scripts
gulp.task 'scripts', ->
  gulp.src "#{config.assets.scripts}/app.coffee", read: false
    .pipe plumber()
    .pipe browserify
      transform: [ 'coffeeify', 'aliasify', 'hoganify' ]
    .pipe concat( 'app.js' )
    .pipe gulp.dest( config.public.scripts )
  

gulp.task 'assets', [ 'styles', 'scripts' ], ->
  gulp.src [ "bower_components/ionicons/fonts/ionicons.*" ]
    .pipe gulp.dest( config.public.fonts )

  gulp.watch( [ "#{config.assets.styles}/app.scss", "#{config.assets.styles}/**/*.scss" ], [ 'styles' ] )
  gulp.watch( [ "#{config.assets.scripts}/app.coffee", "#{config.assets.scripts}/**/*.coffee" ], [ 'scripts' ] )


# build
gulp.task 'serve', [ 'assets' ]
