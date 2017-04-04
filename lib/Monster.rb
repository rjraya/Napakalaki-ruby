#encoding: utf-8
module Model
  class Monster
    def initialize(name,level,bc,prize,bonus=0)
      @name = name
      @combatLevel = level
      @badconsequence = bc
      @prize = prize
      @levelChangeAgainstCultistPlayer = 0
    end
  
    attr_reader :name,:combatLevel,:badconsequence,:prize
    
    def getBasicValue
      return @level
    end
  
    def getSpecialValue
      return @level + @levelAgainstCultistPlayer
    end

    #Cambiar despues para integrar en el juego
    def to_s
      "Name: #{@name}\nCombat level: #{@combatLevel} \nBonus #{@levelAgainstCultistPlayer}"+
      "\nPrize: #{@prize}\nBad consequence: #{@badconsequence.to_s}"
    end
  end
end