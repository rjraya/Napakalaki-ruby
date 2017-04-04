#encoding: utf-8
module Model
  class BadConsequence  
  
    private_class_method :new
 
    def initialize(aText)
      @text = aText
    end
 
    attr_reader :text  
    def to_s
      "Esto es un mal rollo con el siguiente contenido\n"
    end
  end
end
