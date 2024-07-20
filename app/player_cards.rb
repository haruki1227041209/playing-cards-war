# frozen_string_literal: true

require_relative "cards"

class PlayerCards
  attr_reader :cards, :player_1, :player_2

  def initialize
    @cards = Cards.new
    @create_cards = create_cards
    @create_cards.shuffle!
    distribute_cards
  end

  def create_cards
    @cards.create_cards
  end

  def distribute_cards
    @player_1 = []
    @player_2 = []
    @create_cards.each_with_index do |card, index|
      if (index + 1) % 2 == 0
        @player_2 << card
      else
        @player_1 << card
      end
    end
    @player_1.reverse
    @player_2.reverse
  end
end
