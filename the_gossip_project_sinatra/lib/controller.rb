require 'gossip'

class ApplicationController < Sinatra::Base			#récupération de la class Sinatra dans notre code application controller

  get '/gossips/new/' do					#création page new gossip
    erb :new_gossip						#lien de la page new gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save 		#action de sauvegarde avec  									   les 2 variables author et content 								depuis la méthode save dans le fichier gossip.rb
    puts "Salut"						#affichage sur le terminal
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "Et ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  redirect '/'							#une fois l'action fini, retourné à l'index
  end

  get '/gossips/show/' do					#création page gossip show	
    erb :show, locals: {gossips: Gossip.all}			#lien de la page gossip show avec variable 								     gossip.all		
  end

  get '/' do							#création page index 
    erb :index, locals: {gossips: Gossip.all}			#lien de l'index avec variable gossip.all
  end

  get '/gossips/:id/' do
    erb :show, locals: {show: Gossip.all.find(params['id'].to_i)} #"Voici le numéro du potin que tu veux :								    	#{params['id']}!"
  end

end

