require_relative 'player_cards.rb'

class WarFunction
  def initialize
    @player_cards = PlayerCards.new
  end

  def player_cards
    @player_cards.distribute_cards
  end

  def war
    p @player_cards
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

war = WarFunction.new
war.player_cards
p war