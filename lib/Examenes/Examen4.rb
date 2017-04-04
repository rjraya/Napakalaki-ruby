#encoding: utf-8
require_relative "BadConsequence"
require_relative "Player"
require_relative "CombatResult"
require_relative "Napakalaki"
require_relative "Prize"
require_relative "Monster"
require_relative "Dice"
require_relative "Treasure"
require_relative "TreasureKind"
require_relative "CultistPlayer"
require_relative "Cultist"
require_relative "BadTreasureKind"
require_relative "BadDeath"
require_relative "BadNumberOfTreasures"
module Model
  class Examen4
    @@numVeces = 0
    def self.run
      @@numVeces = @@numVeces + 1
      h = Treasure.new("h",0,4,7,TreasureKind::HELMET)
      s = Treasure.new("s", 600, 3, 4, TreasureKind::SHOE)
      a = Treasure.new("a", 400, 2, 5, TreasureKind::ARMOR)
      b = Treasure.new("b", 800, 1, 1, TreasureKind::BOTHHANDS)
      o = Treasure.new("o", 400, 3, 6, TreasureKind::ONEHAND)
      n = Treasure.new("n", 1000, 0, 0, TreasureKind::NECKLACE)
      th = TreasureKind::HELMET
      ts = TreasureKind::SHOE
      ta = TreasureKind::ARMOR
      tb = TreasureKind::BOTHHANDS
      to = TreasureKind::ONEHAND
      tn = TreasureKind::NECKLACE
      vis = [o,s,a]
      hid = [b,h,a]
      p1 = Player.new("p1")
      p2 = Player.new("p2")
      p1.setVisibleTreasureList(vis)
      p2.setVisibleTreasureList(vis)
      p1.setHiddenTreasureList(hid)
      p2.setHiddenTreasureList(hid)
      for v in vis
        puts v.to_s
      end
      for v in hid
        puts v.to_s
      end
      puts p1.to_s
      puts p2.to_s
      carta = Cultist.new("Cultist",1)
      p1 = CultistPlayer.new(p1,carta)
      puts p1.to_s
      puts p2.to_s
      p2 = CultistPlayer.new(p2,carta)
      puts p1.to_s
      puts p2.to_s
      p1.setVisibleTreasureList([])
      p2.setVisibleTreasureList([])
      p1.setHiddenTreasureList([])
      p2.setHiddenTreasureList([])
      puts p1.to_s
      puts p2.to_s
      

      bc = BadTreasureKind.new("b",1,[to,tb,th,ta],[])
      puts bc.to_s
      puts bc.adjustToFitTreasureLists(vis, []).to_s #!!!!!!!!!!!!!atencion!!!!!!!!!!!!!!!!
            
      bc = BadTreasureKind.new("b",1,[to,to,tb],[])
      puts bc.to_s
      puts bc.adjustToFitTreasureLists(vis, []).to_s
            
      bc = BadDeath.new("hola")
      puts bc.to_s
      puts bc.adjustToFitTreasureLists(vis,[]).to_s
    end
    
    def getNumVeces
      @@numVeces
    end
    
  end
end
Model::Examen4.run
#puts "Se ha ejecutado #{Model::Examen4.new.getNumVeces} veces"

