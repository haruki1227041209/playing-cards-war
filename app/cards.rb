class Cards
  attr_reader :suit, :numbers

  def initialize
    @suit = ["スペード", "ハート", "ダイヤ", "クラブ"]
    @numbers = [14, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] # Aを14、Jを11、Qを12、Kを13としている
  end

  def create_cards
    @suit.product(@numbers)
  end
end