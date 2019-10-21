require 'gossip'

class ApplicationController < Sinatra::Base

  get '/gossips/new/' do
    erb :new_gossip
  end

  get '/gossips/show/' do
    erb :show
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    puts "Salut"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "Et ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  redirect '/'
  end

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

end

