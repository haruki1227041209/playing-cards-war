# frozen_string_literal: true

require_relative "cards"

class PlayerCards
  attr_reader :cards, :number_players

  def initialize(number_players)
    @number_players = number_players
    @cards = Cards.new
    @create_cards = create_cards
    @create_cards.shuffle!
    distribute_cards
  end

  def create_cards
    @cards.create_cards
  end

  def players_array
    Array.new(@number_players).map{ [] }
  end

  def distribute_cards
    @players_array = players_array
    @create_cards.each_with_index do |card, index|
      @players_array[index % @players_array.length] << card
    end
    p @players_array[0].length
    p @players_array[1].length
    p @players_array[2].length
    p @players_array[3].length
    p @players_array[4].length
    #@player_1.reverse
    #@player_2.reverse
  end
end

cards = PlayerCards.new(5)
p cards
