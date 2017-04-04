require_relative 'CombatResult'
require_relative 'Treasure.rb'
require_relative 'Monster.rb'
require_relative 'TreasureKind.rb'
require_relative 'Dice.rb'
require_relative 'Player.rb'
require_relative 'CardDealer.rb'
require 'singleton'
module Model 
class Examen2
 @@instance = nil
 def self.getInstance()
   if @@instance == nil then @@instance = new; return @@instance; end
 end
 def run
   p = Player.new("1")
   c = CardDealer.instance
   p.setHiddenTreasureList([c.nextTreasure(),c.nextTreasure(),c.nextTreasure(),c.nextTreasure(),c.nextTreasure(),c.nextTreasure(),c.nextTreasure(),c.nextTreasure()])
   p.setVisibleTreasureList([c.nextTreasure(),c.nextTreasure(),c.nextTreasure()])
   puts p.validState
   bc = BadConsequence.newSpecificTreasures("Pierdes la armadura visible",0,[], [])
   p2 = Player.new("2")
   p2.setPendingBadConsequence(bc)
   puts p2.validState
   bc = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesoros visibles",0,0, 0)
   p3 = Player.new("3")
   p3.setPendingBadConsequence(bc)
   puts p3.validState
   bc = BadConsequence.newSpecificTreasures("Pierdes la armadura visible",0,[], [TreasureKind::SHOE])
   p4 = Player.new("4")
   p4.setPendingBadConsequence(bc)
   puts p4.validState
 end
end
Examen2.getInstance().run
end



