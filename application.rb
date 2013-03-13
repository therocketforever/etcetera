#encoding: UTF-8

class Application < Sinatra::Base
  enable :inline_templates
  
  configure(:production){}
  configure(:development){Bundler.require(:development)}
  configure(:test){}

  get '/style.css' do
    content_type :css, :charset => "utf-8"
    scss :style
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

  footer
    p Wow! I am a footer!!

@@index
h1.hello Hello From Slim!
