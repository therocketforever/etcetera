#encoding: UTF-8

class Application < Sinatra::Base
  enable :inline_templates

  get '/' do
    slim :index
  end
end

__END__

@@layout
doctype html
html
  head
    title Slim Investigation

  body
    == yield

  footer

@@index
h1 Hello From Slim!
