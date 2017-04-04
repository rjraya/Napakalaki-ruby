require_relative 'CombatResult'
require_relative 'Treasure'
require_relative 'Monster'
require_relative 'TreasureKind'
require_relative 'Dice'

module Model
  class Player
 
    @@MAXHIDDENTREASURES = 4
    
    def initialize(name)
      @dead = true
      @name = name  
      @level = 1   #el jugador empieza con 1 nivel
      @pendingBadConsequence = nil
      @hiddenTreasures = []
      @visibleTreasures = []
    end
    
    def copyPlayer(player)
      @dead = player.isDead
      @name = player.getName
      @level = player.getLevel
      @pendingBadConsequence = player.getBC
      @hiddenTreasures = player.getHiddenTreasures
      @visibleTreasures = player.getVisibleTreasures
    end
  
    private 
    def bringToLife() #no es la denominación del diagrama de clases
      @dead = false
    end
  
    def incrementLevels(i)
      @level += i
      if @level > 10 then @level = 10
      end
    end
    
  
    def decrementLevels(i)
      @level = @level-i
      if @level < 1 then @level = 1 end
    end
    
    private
    def setPendingBadConsequence(bc)
      @pendingBadConsequence = bc
    end
   
    def die
      for v in @visibleTreasures do CardDealer.instance.giveTreasureBack(v) end
      @visibleTreasures.clear()
      for v in @hiddenTreasures do CardDealer.instance.giveTreasureBack(v) end
      @hiddenTreasures.clear()
      @dead = true; @level = 1
    end
    
    def discardNecklaceIfVisible
      for v in @visibleTreasures do
        if(v.type == TreasureKind::NECKLACE)
          CardDealer.instance.giveTreasureBack(v)
          @visibleTreasures.delete(v)
        end
      end
    end
  
    def dieIfNoTreasures
      if @hiddenTreasures.length == 0 && @visibleTreasures.length == 0 then die() end
    end
  
    def canIBuyLevels(i)
      return @level + i < 10 
    end
   
    protected
    def getLevel
      return @level
    end
    
    def getBC
      return @pendingBadConsequence
    end
    #Oro que se obtiene al vender un lista de tesoros
    def computeGoldCoinsValue(t)
      suma = 0
      for v in t do
        suma += v.goldCoins
      end
      return niveles = suma / 1000 
    end
    
    public
    def applyPrize(p)
      incrementLevels(p.levels)
      for i in 1..p.treasures do
        @hiddenTreasures << CardDealer.instance.nextTreasure
      end
    end
  
    def combat(m)
      if getCombatLevel() > getOponentLevel(m)
        applyPrize(m.prize)
        if @level < 10 then result = CombatResult::WIN
        else result = CombatResult::WINANDWINGAME end
      else
        if(Dice.instance.nextNumber() < 5)
          if m.badconsequence.kills() then die();result = CombatResult::LOSEANDDIE
          else 
            if shouldConvert
              result = CombatResult::LOSEANDCONVERT
            else
              applyBadConsequence(m.badconsequence);result = CombatResult::LOSE
              result = CombatResult::LOSEANDESCAPE
            end
          end
        end
      end
      discardNecklaceIfVisible()
      return result
    end
  
    def applyBadConsequence(bad)
      decrementLevels(bad.levels)
      setPendingBadConsequence(bad.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures))
    end
  
    def makeTreasureVisible(t)
      if canMakeTreasureVisible(t)
        @hiddenTreasures.delete(t)
        @visibleTreasures << t
        return true
      else
        return false
      end
    end

    def canMakeTreasureVisible(t)
      tipo = t.type
      presente = false
      if(tipo == TreasureKind::ONEHAND)
        manos = 0 #cuenta onehands
        for v in @visibleTreasures do
          if(v.type == TreasureKind::BOTHHANDS) then presente = true
          elsif(v.type == TreasureKind::ONEHAND) then manos += 1 end
        end
        presente ||= manos >= 2 #si hay dos onehands o un bothhands  
      elsif(tipo == TreasureKind::BOTHHANDS)
        for v in @visibleTreasures do
          if(v.type == TreasureKind::BOTHHANDS || v.type == TreasureKind::ONEHAND) 
            presente = true end
        end  
      else
        for v in @visibleTreasures do if(tipo == v.type) then presente = true end end
      end
      
      return !presente
    end

    def discardVisibleTreasure(t)
      @visibleTreasures.delete_at(@visibleTreasures.index(t)) #elimina la primera ocurrencia
      #si hay mal rollo que cumplir contamos el descarte
      if(@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty())
        @pendingBadConsequence.substractVisibleTreasure(t)
      end
      CardDealer.instance.giveTreasureBack(t)
      dieIfNoTreasures() 
    end
  
    def discardHiddenTreasure(t)
     @hiddenTreasures.delete_at(@hiddenTreasures.index(t)) #elimina la primera ocurrencia
      #si hay mal rollo que cumplir contamos el descarte
      if(@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty())
        @pendingBadConsequence.substractHiddenTreasure(t)
      end
      CardDealer.instance.giveTreasureBack(t)
      dieIfNoTreasures() 
    end
  
    def buyLevels(visible,hidden)
      levels = computeGoldCoinsValue(visible)+computeGoldCoinsValue(hidden)
      if canIBuyLevels(levels)
        incrementLevels(levels)
        for v in visible do discardVisibleTreasure(v) end
        for v in hidden do discardHiddenTreasure(v) end 
        return true
      else 
        return false #no puedo comprarlos
      end    
    end
  
    def getCombatLevel
      combatlevel = @level;
      necklace = false; #look for necklace in visible treasures 
      for v in @visibleTreasures do 
       if v.type == TreasureKind::NECKLACE then necklace = true end
      end
		  for v in @visibleTreasures do 
        combatlevel += necklace ? v.getSpecialValue : v.getBasicValue 
      end
      return combatlevel
    end
    
    def validState
      #evitamos que se llame a isEmpty si es nil
      return (@pendingBadConsequence == nil || @pendingBadConsequence.isEmpty) && @hiddenTreasures.length <= 4
    end

    def initTreasures
      bringToLife
      num = Dice.instance.nextNumber()
      #los tesoros recibidos por el jugador siempre pasarán a formar 
      #parte de la lista de tesoros ocultos
      if num == 1
        @hiddenTreasures << CardDealer.instance.nextTreasure
      elsif num == 6 
        @hiddenTreasures << CardDealer.instance.nextTreasure
        @hiddenTreasures << CardDealer.instance.nextTreasure
        @hiddenTreasures << CardDealer.instance.nextTreasure
      else
        @hiddenTreasures << CardDealer.instance.nextTreasure
        @hiddenTreasures << CardDealer.instance.nextTreasure
      end
    end
  
    def isDead
      return @dead
    end

    def hasVisibleTreasures
      return @visibleTreasures.length > 0 #empty?
    end
    
    def getVisibleTreasures
      return @visibleTreasures
    end
    
    def getHiddenTreasures
      return @hiddenTreasures
    end
    
    def getName()
      return @name
    end
        
    def to_s
      bc = @pendingBadConsequence == nil ? "Ninguno\n" : @pendingBadConsequence.to_s
      pls = "#{@name}. Nivel: #{@level} Combate: #{getCombatLevel} \nMal Rollo: #{@pendingBadConsequence.to_s}\n"
      vis = "Visibles:\n"
      for t in @visibleTreasures do
        vis += t.to_s + "\n"
      end
      hid = "Ocultos:\n"
      for t in @hiddenTreasures do
        hid += t.to_s + "\n"
      end
      
      return "#{pls}#{vis}#{hid}"
    end
    
    protected
    def getOponentLevel(m)
      return m.getBasicValue()
    end
    
    def shouldConvert
      return Dice.instance().nextNumber() == 6
    end
    
    #EXAMEN
    public
    def setVisibleTreasureList(vis)
      @visibleTreasures = vis
    end
    
    def setHiddenTreasureList(hid)
      @hiddenTreasures = hid
    end
    #FIN EXAMEN
  end
end