
require_relative 'BadConsequence.rb'
require_relative "Player"
require_relative "CultistPlayer"
require_relative "Treasure"
require_relative "Cultist"
class Prueba
  include Model
  def self.met
    p = Player.new("Rodrigo")
    c = Cultist.new("Cultista",1)
    cp = CultistPlayer.new(p,c)
    puts cp.to_s
  end
end

Prueba.met