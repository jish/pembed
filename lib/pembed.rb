require 'open-uri'

require 'sinatra/base'
require 'yajl'

class PEmbed < Sinatra::Base

  set :public, File.dirname(__FILE__) + '/../public'
  set :views,  File.dirname(__FILE__) + '/../views'

  get '/' do
    erb :index
  end

  get '/gist/:id.json' do |id|
    content_type :json
    html = open("https://gist.github.com/#{id}.pibb")
    attributes = { :html => html.read }
    Yajl::Encoder.encode(attributes)
  end

  get '/iframe' do
    erb :iframe
  end

  get '/jsonp' do
    erb :jsonp
  end

end
