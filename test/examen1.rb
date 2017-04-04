#encoding: utf-8
require_relative "treasurekind.rb"
require_relative "bad_consequence.rb"
require_relative "monster.rb"
require_relative "prize"
class Examen1
  def run
    monsters = Array.new
    bc = BadConsequence.newSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible",
    0,[TreasureKind::BOTHHANDS],[TreasureKind::BOTHHANDS,TreasureKind::SHOE,TreasureKind::SHOE])
    prize = Prize.new(1,1)
    monsters << (Monster.new("Chibithulhu",2,bc,prize))
    
    bc = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto")
    prize =  Prize.new(2,1)
      monsters << Monster.new("Los hondos", 8, bc, prize)
      
    bc = BadConsequence.newNumberOfTreasures("Toses los pulmones y pierdes 4 niveles y 6 tesoros visibles", 4,6,0)
    prize =  Prize.new(1,1)
    monsters << Monster.new("La que redacta en las tinieblas", 2, bc, prize)

     bc = BadConsequence.newNumberOfTreasures("Toses los pulmones y pierdes 2 niveles,2 tesoros visibles y uno oculto", 2,2,1)
    prize =  Prize.new(1,1)
    monsters << Monster.new("La que no redacta en las tinieblas", 2, bc, prize)
    puts "Tesoros ocultos"
    for v in monsters do
      if(v.badconsequence.nHiddenTreasures > 0)
        puts v.to_s
        puts
      end
    end
    puts "Muerte"
    for v in monsters do
      if(v.badconsequence.death == true)
        puts v.to_s
        puts
      end
    end
    puts "Ganas 1 o mas"
    for v in monsters do
      if(v.prize.levels > 0)
        puts v.to_s
        puts
      end
    end
    puts "incluyo un tesoro shoe"
    for v in monsters do
      if(v.badconsequence.specificHiddenTreasures.include?(TreasureKind::SHOE))
        puts v.to_s
        puts
      end
    end
  end
end

Examen1.new.run
