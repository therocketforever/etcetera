#encoding: UTF-8

class Application < Sinatra::Base
  enable :inline_templates
  
  configure(:production){}
  configure(:development){Bundler.require(:development)}
  configure(:test){}

  helpers do
    def handlebars(template, options = {}, locals = {}, &block)
      render(:handlebars, template, options, locals, &block)
    end
  end

  get '/style.css' do
    content_type :css, :charset => "utf-8"
    scss :style
  end
  
  get '/' do
    slim :index
  end
  
  get '/handlebars' do
    handlebars :handlebars
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
<h1>Hello from Handlebars</h1>