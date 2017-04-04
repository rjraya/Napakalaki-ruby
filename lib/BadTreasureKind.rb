#encoding: utf-8
require_relative "BadConsequence"
require_relative "TreasureKind"

module Model
  class BadTreasureKind < BadConsequence
    
    public_class_method :new
    
    def initialize(text, levels, tVisible, tHidden)
      super(text)
      @levels = levels;
      @specificVisibleTreasures = tVisible;
      @specificHiddenTreasures = tHidden;
    end
    
    attr_reader :levels,:specificVisibleTreasures,:specificHiddenTreasures

    def isEmpty()
      @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
    end
    
    def kills()
      false
    end
    
    def substractVisibleTreasure(t)
      @specificVisibleTreasures.delete_at(@specificVisibleTreasures.index(t.type) ||
        @specificVisibleTreasures.length)
    end
    
    def substractHiddenTreasure(t)
      @specificHiddenTreasures.delete_at(@specificHiddenTreasures.index(t.type) ||
        @specificHiddenTreasures.length)
    end
    
    def adjustToFitTreasureLists(v,h)
      tiposvisibles = v.map {|x| x.type}; newVisibles = []
      for k in @specificVisibleTreasures do
        eliminado = false
        if !eliminado#cambiar
         if tiposvisibles.include?(k)
          newVisibles << k
          tiposvisibles.delete_at(tiposvisibles.index(k))
         end
        end
      end
      
      tiposhidden = h.map {|x| x.type}; newHidden = []
      for k in @specificHiddenTreasures do
        eliminado = false
        if !eliminado 
         if tiposhidden.include?(k)
           newHidden << k
           tiposhidden.delete_at(tiposhidden.index(k))
           eliminado = true
         end
        end
      end
      
       BadTreasureKind.new(@text, @levels, newVisibles, newHidden)
    end
    
    def to_s
      visibles = ""
      for t in @specificVisibleTreasures do
        visibles += t.to_s + " "
      end
      
      if visibles == ""
        visibles = "ningun visible"
      else
        visibles += "visibles"
      end
      
      ocultos = ""
      for t in @specificHiddenTreasures do
        ocultos += t.to_s + " "
      end
      
      if ocultos == ""
        ocultos = "ningun oculto"
      else
        ocultos += "ocultos"
      end
      
      super+"Texto: #{@text}\nNiveles: #{@levels}\nDebes descartarte de #{visibles} y #{ocultos}"
    end
  end
end