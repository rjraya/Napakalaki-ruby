require_relative "Napakalaki"
require_relative "GameTester"

module Model

  class EjemploMain
      def self.main
       test = Test::GameTester.instance
       game = Napakalaki.instance
       #Se prueba el juego con 2 jugadores
       test.play(game, 2) 
      end
      
  end

end

if $0 == __FILE__
  Model::EjemploMain.main()
end