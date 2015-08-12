browserify  = require 'gulp-browserify'

gulp        = require 'gulp'
plumber     = require 'gulp-plumber'
del         = require 'del'
path        = require 'path'

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
    images:    "./app/_assets/images"
  public:
    styles:    "./app/public/css"
    scripts:   "./app/public/js"
    fonts:     "./app/public/fonts"
    images:    "./app/public/images"

# styles
gulp.task 'styles', ->
  i = 0
  dirs = []
  files = bowerFiles
    filter: [ '**/*.css', '**/*.scss']
    base: path.join __dirname, 'bower_components'

  while i < files.length
    dirs.push path.dirname files[i] 
    i++

  dirs.push config.assets.styles

  sass "#{config.assets.styles}/app.scss",
    require: [ 'sass-globbing', 'susy' ]
    loadPath: dirs
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

  gulp.src(["#{config.assets.images}/*.png"])
    .pipe(gulp.dest(config.public.images))

  gulp.watch( [ "#{config.assets.styles}/app.scss", "#{config.assets.styles}/**/*.scss" ], [ 'styles' ] )
  gulp.watch( [ "#{config.assets.scripts}/app.coffee", "#{config.assets.scripts}/**/*.coffee" ], [ 'scripts' ] )


# build
gulp.task 'serve', [ 'assets' ]
