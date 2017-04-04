module Model
  class Cultist
    def initialize(name, gainedLevels)
      @name = name
      @gainedLevels = gainedLevels
    end
    
    def getBasicValue
      return @gainedLevels
    end
    
    def getSpecialValue
      return getBasicValue*CultistPlayer.getTotalCultistPlayers
    end
  end
end