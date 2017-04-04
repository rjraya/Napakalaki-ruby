#encoding: utf-8
module Model
  class Treasure
    def initialize(name,goldCoins,minBonus,maxBonus,t)
      @name = name
      @goldCoins = goldCoins
      @minBonus = minBonus
      @maxBonus = maxBonus
      @type = t
    end
  
    def to_s
      @name + ": " + @goldCoins.to_s + " oro, Bonus: (" + @minBonus.to_s + "/" + @maxBonus.to_s +
        ") Tipo: " + @type.to_s
    end
 
    attr_reader :name,:goldCoins,:minBonus,:maxBonus,:type
  
    def getBasicValue
      return @minBonus
    end
    
    def getSpecialValue
      return @maxBonus
    end
    
  end
end




