#encoding: UTF-8

class Application < Sinatra::Base
  enable :inline_templates
  
  configure(:production){}
  configure(:development){Bundler.require(:development)}
  configure(:test){}

  Tilt.register :handlebars, HandlebarsTemplate

  helpers do
    def handlebars(*args) render(:handlebars, *args) end
  end

  get '/style.css' do
    content_type :css, :charset => "utf-8"
    scss :style
  end
  
  
  get '/' do
    slim :index
  end
end

Binding.pry
__END__

@@layout
doctype html
html
  head
    title Slim Investigation

  body
    == yield

  footer
    p Wow! I am a footer!!

@@index
h1 Hello From Slim!
script data-template-name="application" type="text/x-handlebars"
  | {{ message }}
script src="app/assets/javascripts/app.js"

@@handlebars