#!/usr/bin/env ruby
# encoding: utf-8
require 'singleton'
require_relative 'Treasure.rb'
require_relative 'Monster.rb'
require_relative 'Player.rb'
require_relative 'BadConsequence.rb'
require_relative 'Prize.rb'
require_relative 'Dice.rb' 
require_relative 'CombatResult.rb'
require_relative 'CardDealer.rb'
require_relative 'CultistPlayer.rb'

module Model
  class Napakalaki
    include Singleton

    def initialize
      @players = []
      @currentPlayer = nil
      @currentMonster = nil
      @currentPlayerIndex = -1
    end

    private
    def initPlayers(names)
      for v in names do
        @players << Player.new(v)
      end
    end

    def nextPlayer
      if(@currentPlayer == nil) then @currentPlayerIndex = rand(@players.length);
      else @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.length end
      @currentPlayer = @players[@currentPlayerIndex]
      return @currentPlayer
    end

    public
    def combat
      result = @currentPlayer.combat(@currentMonster)
      if result == CombatResult::LOSEANDCONVERT
        sectario = CultistPlayer.new(@currentPlayer, CardDealer.instance.nextCultist)
        @players[@currentPlayerIndex] = sectario
        @currentPlayer = sectario
      end
      CardDealer.instance.giveMonsterBack(@currentMonster)
      return result
    end

    def discardVisibleTreasure(t)
      @currentPlayer.discardVisibleTreasure(t)
    end

    def discardHiddenTreasure(t)
      @currentPlayer.discardHiddenTreasure(t)
    end

    def makeTreasureVisible(t)
      return @currentPlayer.canMakeTreasureVisible(t);
    end

    def buyLevels(visible,hidden)
      return @currentPlayer.buyLevels(visible, hidden)
    end

    def initGame(players)
      CardDealer.instance.initCards()
      initPlayers(players)
      nextTurn()
    end

    def getCurrentPlayer
      return @currentPlayer
    end

    def getCurrentMonster
      return @currentMonster
    end

    def canMakeTreasureVisible(t)
      return @currentPlayer.canMakeTreasureVisible(t)
    end

    def getVisibleTreasures
      return @visibleTreasures
    end

    def getHiddenTreasures
      return @hiddenTreasures
    end

    def nextTurn
      if nextTurnAllowed
        @currentMonster = CardDealer.instance.nextMonster
        @currentPlayer = nextPlayer
        if @currentPlayer.isDead
          @currentPlayer.initTreasures
        end
        return true
      else
        return false
      end
    end

    def nextTurnAllowed
      return @currentPlayer == nil || @currentPlayer.validState()
    end

    def endOfGame(result)
      return result == CombatResult::WINANDWINGAME
    end
  end
end
