require_relative "Monster.rb"
require_relative "TreasureKind.rb"
require_relative "BadTreasureKind.rb"
require_relative "Prize.rb"
require_relative "CardDealer.rb"
require_relative "BadNumberOfTreasures.rb"
require_relative "BadDeath.rb"

class Mainfacil
  include Model
  def self.run
#    bc = BadTreasureKind.new("b",2,[],[])
#    pr = Prize.new(3, 2)
#    a = Monster.new("h",3,bc,pr)
#    for v in CardDealer.instance.unusedMonsters do
#      if v.combatLevel > 10
#        puts v.to_s
#        puts
#      end
#    end
#    for v in CardDealer.instance.unusedMonsters do
#      bc = v.badconsequence
#      if bc.class == BadTreasureKind then 
#        if bc.specificVisibleTreasures.empty? && bc.specificHiddenTreasures.empty? then 
#          puts v.to_s
#        end
#      end
#      if bc.class == BadNumberOfTreasures then 
#        if bc.nHiddenTreasures == 0 && bc.nVisibleTreasures == 0 then
#          puts v.to_s
#        end
#      end
#    end
#    for v in CardDealer.instance.unusedMonsters do
#      if v.prize.levels > 1
#        puts v.to_s
#      end
#    end
#    for v in CardDealer.instance.unusedMonsters do
#      bc = v.badconsequence
#      if bc.class == BadTreasureKind
#        if bc.specificVisibleTreasures.include?(TreasureKind::ONEHAND) || 
#            bc.specificHiddenTreasures.include?(TreasureKind::ONEHAND)
#          puts v.to_s
#        end
#      end
#    end
  end
end
include Model
CardDealer.instance.initMonsterCardDeck
Mainfacil.run

