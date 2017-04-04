require 'singleton'
module Model
  class Dice
    include Singleton
  
    def nextNumber()
      return rand(6) + 1;
    end

  end
end