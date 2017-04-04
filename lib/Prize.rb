#encoding: utf-8
class Prize
  
  def initialize(treasures, levels)  
    @treasures = treasures
    if(levels > 1)
      @levels = levels 
    else
      @levels = 1
    end    
  end
  
  #Cambiar despues para integrar en el juego
  def to_s
   "Tesoros ganados: #{@treasures} \n Niveles ganados: #{@levels}"
  end
  
  attr_reader :treasures,:levels
end  