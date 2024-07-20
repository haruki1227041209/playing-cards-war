# frozen_string_literal: true

class Cards
  attr_reader :suit, :numbers

  def initialize
    @suit = ["スペード", "ハート", "ダイヤ", "クラブ"]
    @numbers = (2..14).to_a # Aを14、Jを11、Qを12、Kを13としている
  end

  def create_cards
    @suit.product(@numbers)
  end
end
