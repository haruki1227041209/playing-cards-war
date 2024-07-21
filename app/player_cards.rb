# frozen_string_literal: true

require_relative "cards"

class PlayerCards
  attr_reader :cards, :number_players, :players_array

  def initialize(number_players)
    @number_players = number_players
    @cards = Cards.new
    @create_cards = create_cards
    @create_cards.shuffle!
    @players_array = Array.new(@number_players).map{ [] }
    distribute_cards
  end

  def create_cards
    @cards.create_cards
  end

  def distribute_cards
    @create_cards.each_with_index do |card, index|
      @players_array[index % @players_array.length] << card
    end
    #@player_1.reverse
    #@player_2.reverse
  end
end

#cards = PlayerCards.new(5)
#p cards
