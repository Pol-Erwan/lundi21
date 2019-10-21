#require 'pry'
require 'csv'

class Gossip
  attr_accessor :author, :content				#definir variable

  def initialize(author,content)				#methode initialisation variables
    @author = author
    @content = content
  end

  def save							#methode sauvegarde des potins
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]				#écrire author et content dans le file csv
    end
  end

  def self.all							#methode garder tous les potins
    all_gossips = []						#création tableau pour stocker les potins
    CSV.read("./db/gossip.csv").each do |csv_line|		#lire chaque ligne du fichier csv
      all_gossips << Gossip.new(csv_line[0], csv_line[1])	#mettre chaque ligen dans chaque case du tableau
    end
    return all_gossips						#sortir la variable tableau de la methode
  end
	
  def self.find(id)						#methode pour trouver un potin
    return gossip.all[id]					#ressortir le poton voulu
  end

end
#binding.pry
