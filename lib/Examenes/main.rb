#encoding: utf-8
require_relative "TreasureKind"
require_relative "BadConsequence"
require_relative "Monster"
require_relative "Prize"



#for v in monsters do 
#  if v.combatLevel > 10
#    puts v.to_s
#    puts 
#  end
#end

#for v in monsters do 
#  bad = v.badconsequence
#  cond = bad.levels > 0 && bad.death == false && bad.nVisibleTreasures == 0 
#  cond = cond && bad.nHiddenTreasures == 0 && bad.specificVisibleTreasures.empty? && bad.specificHiddenTreasures.empty?
#  if(cond) 
#   puts v.to_s
#   puts
#  end
#end

#for v in monsters do
#  cond = v.badconsequence.specificVisibleTreasures.include?(TreasureKind::ONEHAND)
#  cond = cond || v.badconsequence.specificHiddenTreasures.include?(TreasureKind::ONEHAND)
#  if(cond)
#    puts v.to_s
#    puts
#  end
#end



