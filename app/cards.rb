class Cards
  attr_reader :number

  def initialize
    cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    @number = {
      "スペード" => cards,
      "ハート" => cards,
      "ダイヤ" => cards,
      "クラブ" => cards
    }
  end
end
=begin
cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
number = {
  "スペード" => cards,
  "ハート" => cards,
  "ダイヤ" => cards,
  "クラブ" => cards
}

all_cards = number.flat_map do |suit, cards|
  cards.map { |card| "#{suit}: #{card}" }
end
p all_cards
all_cards.shuffle.each do |card|
  puts card
end

p number
=end

suit = ["スペード", "ハート", "ダイヤ", "クラブ"]
numbers = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

A = []
B = []

all_cards = suit.product(numbers)
all_cards.shuffle.each_with_index do |card, index|
  if (index + 1) % 2 == 0
    B << card
  else
    A << card
  end
end

p A
p B

#"#{card[0]}の#{card[1]}"