# frozen_string_literal: true

require_relative "player_cards"
# require 'debug'

class WarFunction
  attr_accessor :player_cards

  def initialize
    @player_cards = PlayerCards.new
    @player1 = @player_cards.player_1
    @player2 = @player_cards.player_2
  end

  def war
    @get_player1 = []
    @get_player2 = []
    @save_player_card = []
    puts "戦争を開始します。"
    puts "カードが配られました。"
    until @player1.empty? || @player2.empty?
      # binding.break
      @save_player1 = @player1[0].dup # 手札を保存
      @save_player2 = @player2[0].dup
      result = war_result # 結果を先に計算
      change_cards(@save_player1, @save_player2) # 該当する手札をA,J,Q,Kに変換

      puts "戦争！"
      puts "プレイヤー1のカードは#{@save_player1[0]}の#{@save_player1[1]}です。"
      puts "プレイヤー2のカードは#{@save_player2[0]}の#{@save_player2[1]}です。" # 手札を表示
      puts result

      if @player1.empty?
        @player1 += @get_player1.shuffle
        @get_player1 = []
      end
      if @player2.empty?
        @player2 += @get_player2.shuffle
        @get_player2 = []
      end

      # break if @player1.empty? || @player2.empty?
      # break unless @player1[0] == @player2[0]
    end

    puts "--------------------------------"
    if @player1.length > @player2.length
      puts "プレイヤー2の手札がなくなりました。"
      puts "プレイヤー1の手札の枚数は#{@player1.length + @get_player1.length}枚です。プレイヤー2の手札の枚数は0枚です。"
      puts "プレイヤー1が1位、プレイヤー2が2位です。"
    else
      puts "プレイヤー1の手札がなくなりました。"
      puts "プレイヤー2の手札の枚数は#{@player2.length + @get_player2.length}枚です。プレイヤー1の手札の枚数は0枚です。"
      puts "プレイヤー2が1位、プレイヤー1が2位です。"
    end
    puts "戦争を終了します。"

=begin
    p @player1
    p @player2
    p @player1.length
    p @player2.length
    p @save_player_card
    p @get_player1
    p @get_player2
    p @get_player1.length
    p @get_player2.length
=end
  end

  def war_result
    if @player1[0][1] == @player2[0][1]
      @save_player_card << @player1.shift
      @save_player_card << @player2.shift
      "引き分けです。"
    elsif @player1[0][1] > @player2[0][1]
      unless @save_player_card.empty?
        get_cards = @save_player_card.length / 2 + 1
        @get_player1 += @save_player_card
        @save_player_card = []
        @get_player1 << @player1.shift
        @get_player1 << @player2.shift
        "プレイヤー1が勝ちました。プレイヤー1はカードを#{get_cards}枚もらいました。"
      else
        @get_player1 << @player1.shift
        @get_player1 << @player2.shift
        "プレイヤー1が勝ちました。プレイヤー1はカードを1枚もらいました。"
      end
    else
      unless @save_player_card.empty?
        get_cards = @save_player_card.length / 2 + 1
        @get_player2 += @save_player_card
        @save_player_card = []
        @get_player2 << @player1.shift
        @get_player2 << @player2.shift
        "プレイヤー2が勝ちました。プレイヤー2はカードを#{get_cards}枚もらいました。"
      else
        @get_player2 << @player1.shift
        @get_player2 << @player2.shift
        "プレイヤー2が勝ちました。プレイヤー2はカードを1枚もらいました。"
      end
    end
  end

  def change_cards(save_player1, save_player2)
    change_ace(save_player1, save_player2)
    change_jack(save_player1, save_player2)
    change_queen(save_player1, save_player2)
    change_king(save_player1, save_player2)
  end

  def change_ace(save_player1, save_player2)
    save_player1[1] = "A" if save_player1[1] == 14
    save_player2[1] = "A" if save_player2[1] == 14
  end

  def change_jack(save_player1, save_player2)
    save_player1[1] = "J" if save_player1[1] == 11
    save_player2[1] = "J" if save_player2[1] == 11
  end

  def change_queen(save_player1, save_player2)
    save_player1[1] = "Q" if save_player1[1] == 12
    save_player2[1] = "Q" if save_player2[1] == 12
  end

  def change_king(save_player1, save_player2)
    save_player1[1] = "K" if save_player1[1] == 13
    save_player2[1] = "K" if save_player2[1] == 13
  end
end
