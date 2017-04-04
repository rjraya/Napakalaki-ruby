module Model
  class CultistPlayer < Player
    
    @@totalCultistPlayers = 0

    def initialize(player, cultist)
      copyPlayer(player)
      @myCultistCard = cultist
      @@totalCultistPlayers+=1
    end
    
    def self.getTotalCultistPlayers
      return @@totalCultistPlayers
    end
    
    def getCombatLevel
      return super + @myCultistCard.getSpecialValue
    end
    
    def to_s
      return "Sectario(+#{@myCultistCard.getBasicValue()}x): #{super}"
    end
    
    protected
    def getOponentLevel(monster)
      monster.getSpecialValue
    end
     
    
    def computeGoldCoinsValue(treasures)
      return super * 2
    end
    
    def shouldConvert
      return false
    end
  end
end
