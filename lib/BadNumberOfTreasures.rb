#encoding: utf-8
require_relative "BadConsequence"

module Model
  class BadNumberOfTreasures < BadConsequence
    
    public_class_method :new
    
    def initialize(text, levels, nVisible, nHidden)
      super(text)
      @levels = levels
      @nVisibleTreasures = nVisible
      @nHiddenTreasures = nHidden
    end
    
    attr_reader :levels,:nVisibleTreasures,:nHiddenTreasures
    
    def isEmpty
      @nVisibleTreasures == 0 && @nHiddenTreasures == 0
    end
    
    def kills()
      false
    end
    
    def substractVisibleTreasure(t)
      if @nVisibleTreasures > 0 then @nVisibleTreasures-=1 end
    end
    
    def substractHiddenTreasure(t)
      if @nHiddenTreasures > 0 then @nHiddenTreasures-=1 end
    end
    
    def adjustToFitTreasureLists(visible, hidden)
      minVisible = @nVisibleTreasures > visible.length ? visible.length : @nVisibleTreasures
      minHidden = @nHiddenTreasures > hidden.length ? hidden.length : @nHiddenTreasures
      return BadNumberOfTreasures.new(@text, @levels, minVisible, minHidden);
    end
    
    def to_s
      super+"Texto: #{@text}\nNiveles: #{@levels}\nDebes descartarte de #{@nVisibleTreasures} visibles y
      de #{@nHiddenTreasures} ocultos\n";
    end
  end
end
