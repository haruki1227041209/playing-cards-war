require_relative 'cards.rb'

class PlayerCards
  def initialize
    @cards = Cards.new
    @shuffle_cards = shuffle_cards
    @player_1 = []
    @player_2 = []
  end

  def shuffle_cards
    @cards.create_cards.shuffle
  end

  def distribute_cards
    shuffle_cards.each_with_index do |card, index|
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

cards = PlayerCards.new
cards.shuffle_cards
cards.distribute_cards
p cards


