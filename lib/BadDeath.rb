require_relative "BadConsequence"

module Model
  class BadDeath < BadConsequence
    
    public_class_method :new
    
    def initialize(text)
      super
    end
    
    def isEmpty
      true
    end

    def kills
      true
    end

    def levels
      return 0
    end

    def substractVisibleTreasure(t)end

    def substractHiddenTreasure(t)end

    def adjustToFitTreasureLists(visible, hidden)
      BadDeath.new(text);
    end

    def to_s
      super+"Texto: #{@text}. Mueres :)\n";
    end
  end
end