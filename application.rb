#encoding: UTF-8

class Application < Sinatra::Base
  enable :inline_templates
  
  configure(:production){}
  configure(:development){Bundler.require(:development)}
  configure(:test){}

  helpers Sinatra::Handlebars

  get '/style.css' do
    content_type :css, :charset => "utf-8"
    scss :style
  end
  
	get '/templates' do
		content_type 'application/javascript'
		handlebar 'public/templates/**/*.hbs'
	end
  
  get '/' do
    slim :index
  end
end

#Binding.pry
__END__

@@layout
doctype html
html
  head
    title Slim Investigation

  body
    == yield

  script src="js/ember-1.0.0-rc.1.js"
  script src="templates"
  script src="app/app.js"

  footer
    p Wow! I am a footer!!

@@index
h1.hello Hello From Slim!
