class Cards
  attr_reader :suit, :numbers, :all_cards, :player_1, :player_2

  def initialize
    @suit = ["スペード", "ハート", "ダイヤ", "クラブ"]
    @numbers = [14, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] # Aを14、Jを11、Qを12、Kを13としている
    @all_cards = @suit.product(@numbers)
    @player_1 = []
    @player_2 = []
  end

  def shuffle_cards
    @all_cards.shuffle.each_with_index do |card, index|
      if (index + 1) % 2 == 0
        @player_2 << card
      else
        @player_1 << card
      end
    end

    @player_1.reverse
    @player_2.reverse # 手札を裏向きで上から取るため
  end

  def war
    @player_1.length.times do |i|
      result = ""
      if @player_1[i][1] == @player_2[i][1]
        result = "引き分けです。"
      elsif @player_1[i][1] > @player_2[i][1]
        result = "プレイヤー1が勝ちました。\n戦争を終了します。"
      else
        result = "プレイヤー2が勝ちました。\n戦争を終了します。"
      end
      A_henkan(i)
      J_henkan(i)
      Q_henkan(i)
      K_henkan(i)

      puts "戦争！\nプレイヤー1のカードは#{@player_1[i][0]}の#{@player_1[i][1]}です。"
      puts "プレイヤー2のカードは#{@player_2[i][0]}の#{@player_2[i][1]}です。" #手札を表示
      puts result
      break unless @player_1[i][1] == @player_2[i][1]
    end
  end

  def A_henkan(i) # Aへの変換
    if @player_1[i][1] == 14
      @player_1[i][1] = "A"
    end
    if @player_2[i][1] == 14
      @player_2[i][1] = "A"
    end
  end

  def J_henkan(i) # Jへの変換
    if @player_1[i][1] == 11
      @player_1[i][1] = "J"
    end
    if @player_2[i][1] == 11
      @player_2[i][1] = "J"
    end
  end

  def Q_henkan(i) # Qへの変換
    if @player_1[i][1] == 12
      @player_1[i][1] = "Q"
    end
    if @player_2[i][1] == 12
      @player_2[i][1] = "Q"
    end
  end

  def K_henkan(i) # Kへの変換
    if @player_1[i][1] == 13
      @player_1[i][1] = "K"
    end
    if @player_2[i][1] == 13
      @player_2[i][1] = "K"
    end
  end
end
