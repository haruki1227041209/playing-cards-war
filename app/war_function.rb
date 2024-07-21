# frozen_string_literal: true

require_relative "player_cards"

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
    100.times do |suit_index|
      @save_player1 = @player1[0] # 手札を保存
      @save_player2 = @player2[0]
      p @save_player1, @save_player2
      result = war_result # 結果を先に計算
      change_cards # 該当する手札をA,J,Q,Kに変換

      puts "戦争！"
      #p 0
      #p @player1, @player2
      puts "プレイヤー1のカードは#{@save_player1[0]}の#{@save_player1[1]}です。"
      puts "プレイヤー2のカードは#{@save_player2[0]}の#{@save_player2[1]}です。" # 手札を表示
      puts result
      break if @player1.empty? || @player2.empty?
    end
    p @player1
    p @player2
    p @save_player_card
    p @get_player1
    p @get_player2
    p @get_player1.length
    p @get_player2.length
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
        p @get_player1
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
        p @get_player2
        "プレイヤー2が勝ちました。プレイヤー2はカードを#{get_cards}枚もらいました。"
      else
        @get_player2 << @player1.shift
        @get_player2 << @player2.shift
        "プレイヤー2が勝ちました。プレイヤー2はカードを1枚もらいました。"
      end
    end
  end

  def change_cards
    change_ace
    change_jack
    change_queen
    change_king
  end

  def change_ace
    @save_player1[1] = "A" if @save_player1[1] == 14
    @save_player2[1] = "A" if @save_player2[1] == 14
  end

  def change_jack
    @save_player1[1] = "J" if @save_player1[1] == 11
    @save_player2[1] = "J" if @save_player2[1] == 11
  end

  def change_queen
    @save_player1[1] = "Q" if @save_player1[1] == 12
    @save_player2[1] = "Q" if @save_player2[1] == 12
  end

  def change_king
    @save_player1[1] = "K" if @save_player1[1] == 13
    @save_player2[1] = "K" if @save_player2[1] == 13
  end
end
