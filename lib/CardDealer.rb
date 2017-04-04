#!/bin/env ruby
# encoding: utf-8
require 'singleton'
require_relative 'TreasureKind'
require_relative 'Treasure'
require_relative 'BadConsequence'
require_relative 'Prize'
require_relative 'Monster'
module Model

class CardDealer 
  include Singleton

  def initialize()
    @usedMonsters = []
    @unusedMonsters = []
    @usedTreasures = []
    @unusedTreasures = []
    @unusedCultists = []
  end
  
  private
  def initTreasureCardDeck() 
    @unusedTreasures << Treasure.new("¡Si mi amo!",0,4,7,TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Botas de investigacion", 600, 3, 4, TreasureKind::SHOE)
    @unusedTreasures << Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("A prueba de babas", 400, 2, 5, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Botas de lluvia acida", 800, 1, 1, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Casco minero", 400, 2, 4, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Ametralladora Thompson", 600, 4, 8, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Camiseta de la UGR", 100, 1, 7, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 400, 3, 6, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Fez alopodo", 700, 3, 5, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Hacha prehistorica", 500, 2, 5, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("El aprato del Pr. Tela", 900, 4, 8, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Gaita", 500, 4, 5, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Insecticida", 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 700, 4, 6, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Garabato mistico", 300, 2, 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("La fuerza de Mr.T", 1000, 0, 0, TreasureKind::NECKLACE)
    @unusedTreasures << Treasure.new("La rebeca metálica", 400,2,3,TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Mazo de los antiguos",200,3,4,TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necro-playboycón",300,3,5,TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Lanzallamas",800,4,8,TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-comicón",100,1,1,TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necronomicón",800,5,7,TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Linterna a 2 manos",400,3,6,TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-gnomicón",200,2,4,TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necrotelecom",300,2,3,TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Porra preternatural",200,2,3,TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Zapato deja-amigos",500,0,1,TreasureKind::SHOE)
    @unusedTreasures << Treasure.new("Shogulador",600,1,1,TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Varita de atizamiento",400,3,4,TreasureKind::ONEHAND)
  end
  #ejercicio
  public
  def initMonsterCardDeck()
    bc = BadTreasureKind.new("Pierdes tu armadura visible y otra oculta",
                  0,[TreasureKind::ARMOR], [TreasureKind::ARMOR])
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("3 Byakhees de bonanza",8,bc,prize)

    bc = BadTreasureKind.new("Embobados con el lindo primigenio te descartas de tu casco visible",
        0,[TreasureKind::HELMET],[])
    prize = Prize.new(1,1)
    @unusedMonsters << (Monster.new("Chibithulhu",2,bc,prize))

    bc = BadTreasureKind.new("El primordial bostezo contagioso. Pierdes el calzado visible",
      0,[TreasureKind::SHOE], [])
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("El sopor de Dunwich",2,bc, prize)

    bc = BadTreasureKind.new("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",
      0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    @unusedMonsters << Monster.new("Angeles de la noche ibicenca",14,bc, prize)
 
    #se interpreta que 200 es el maximo numero de tesoros. ver más adelante si definir como constante
    bc = BadNumberOfTreasures.new("Pierdes todos tus tesoros visibles",0,200, 0)
    prize = Prize.new(3,1)
    @unusedMonsters << Monster.new("El gorron en el umbral",10,bc, prize)

    bc = BadTreasureKind.new("Pierdes la armadura visible",0,[TreasureKind::ARMOR], [])
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("H.P.Munchcraft",6,bc, prize)

    bc = BadTreasureKind.new("Sientes bichos bajo la ropa. Descarta la armadura visible.",
        0, [TreasureKind::ARMOR],[])
    prize =  Prize.new(1,1)
    @unusedMonsters << Monster.new("Bichgooth", 2, bc, prize)

    bc = BadNumberOfTreasures.new("Pierdes 5 niveles y 3 tesoros visibles.", 5,3,0)
    prize =  Prize.new(4,2)
    @unusedMonsters << Monster.new("El rey de rosa", 13, bc, prize)

    bc = BadNumberOfTreasures.new("Toses los pulmones y pierdes 2 niveles", 2,0,0)
    prize =  Prize.new(1,1)
    @unusedMonsters << Monster.new("La que redacta en las tinieblas", 2, bc, prize)

    bc = BadDeath.new("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto")
    prize =  Prize.new(2,1)
    @unusedMonsters << Monster.new("Los hondos", 8, bc, prize)

    bc = BadNumberOfTreasures.new("Pierdes 2 niveles y 2 tesoros ocultos", 2,0,2)
    prize =  Prize.new(2,1)
    @unusedMonsters << Monster.new("Semillas Cthulu", 4, bc, prize)

    bc = BadTreasureKind.new("Te intentas escaquear. Pierdes una mano visible",
          0, [TreasureKind::ONEHAND], [])
    prize =  Prize.new(2,1)
    @unusedMonsters << Monster.new("Dameargo", 1, bc, prize)

    bc = BadNumberOfTreasures.new("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
    prize =  Prize.new(1,1)
    @unusedMonsters << Monster.new("Pollipolipo volante", 3, bc, prize)

    bc = BadDeath.new("No le hace gracia que pronuncien mal su nombre. Estas muerto")
    prize =  Prize.new(3,1)
    @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 12, bc, prize)

    bc = BadDeath.new("La famila te atrapa. Estas muerto")
    prize =  Prize.new(4,1)
    @unusedMonsters << Monster.new("Familia feliz", 1, bc, prize)

    bc = BadTreasureKind.new("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro dos manos visible",
          2, [TreasureKind::BOTHHANDS], [])
    prize =  Prize.new(2,1)
    @unusedMonsters<<Monster.new("Roboggoth", 8, bc, prize)

    bc = BadTreasureKind.new("Te asusta en la noche. Pierdes un casco visible.",
          0, [TreasureKind::HELMET], [])
    prize =  Prize.new(1,1)
    @unusedMonsters << Monster.new("El espia", 5, bc, prize)

    bc = BadNumberOfTreasures.new("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2,5,0)
    prize =  Prize.new(1,1)
    @unusedMonsters << Monster.new("El Lenguas", 20,bc, prize)

    bc = BadTreasureKind.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos",
        0, [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
    prize =  Prize.new(1,1)
    @unusedMonsters << Monster.new("Bicefalo", 20,bc, prize)
    
    bc = BadTreasureKind::new("Pierdes 1 mano visible",0, [TreasureKind::ONEHAND],[])
    prize = Prize.new(3,1)
    @unusedMonsters << Monster.new("El mal indecible impronunciable",10,bc,prize,-2)

    bc = BadNumberOfTreasures.new("Pierdes tus tesoros visibles.Jajaja.",0,6,0)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Testigos oculares",6,bc,prize,2)

    bc = BadDeath.new("Hoy no es tu día de suerte. Mueres.")
    prize = Prize.new(2,5)
    @unusedMonsters << Monster.new("El gran cthulhu",20,bc,prize,4)

    bc = BadNumberOfTreasures.new("Tu gobierno te recorta 2 niveles",2,0,0)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Serpiente Político",8,bc,prize,-2)

    bc = BadTreasureKind::new("Pierdes tu caso y tu armadura visible. Pierdes tus manos ocultas",0,
      [TreasureKind::HELMET,TreasureKind::ARMOR], [TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::ONEHAND,
      TreasureKind::ONEHAND,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS])
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Felpuggoth",2,bc,prize,5)

    bc = BadNumberOfTreasures.new("Pierdes 2 niveles",2,0,0)
    prize = Prize.new(4,2)
    @unusedMonsters << Monster.new("Shoggoth",16,bc,prize,-4)

    bc = BadNumberOfTreasures.new("Pinta labios negro. Pierdes 2 niveles",2,0,0)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Lolitagooth",2,bc,prize,3)
  end
  
  def shuffleTreasures()
    #con ! estamos modificando el array sin el se devuelve uno modificado
    #pero el original permanece igual
    @unusedTreasures.shuffle!()
  end

  def shuffleMonsters()
     @unusedMonsters.shuffle!()
  end
  
  def initCultistCardDeck
    @unusedCultists << Cultist.new("Sectario",1)
    @unusedCultists << Cultist.new("Sectario",2)
    @unusedCultists << Cultist.new("Sectario",1)
    @unusedCultists << Cultist.new("Sectario",2)
    @unusedCultists << Cultist.new("Sectario",1)
    @unusedCultists << Cultist.new("Sectario",1)
  end
  
  def shuffleCultists()
    @unusedCultists.shuffle!()
  end
  
  public
  def nextTreasure()
    if(@unusedTreasures.empty?)
      @unusedTreasures = @usedTreasures
      @usedTreasures = []
      shuffleTreasures 
    end
    return @unusedTreasures.shift #Removes the first element of self and returns it  
  end

  def nextMonster()
    if @unusedMonsters.empty? then @unusedMonsters = @usedMonsters;@usedMonsters = [];shuffleTreasures end
    return @unusedMonsters.shift #Removes the first element of self and returns it 
  end
  
  def nextCultist()
    if @unusedCultists.empty?
      return nil #No deberia llegar aqui
    else
      return @unusedCultists.shift #Removes the first element of self and returns it
    end
  end

  def giveTreasureBack(treasure)
      @usedTreasures << treasure
  end

  def giveMonsterBack(monster)
      @usedMonsters << monster
  end

  def initCards()
    initMonsterCardDeck
		shuffleMonsters
		initTreasureCardDeck
		shuffleTreasures
    initCultistCardDeck 
    shuffleCultists
  end

end
end
