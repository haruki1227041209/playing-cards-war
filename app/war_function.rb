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
    @player1.length.times do |battle_time|
      result = war_result(battle_time) # 結果を先に計算
      change_cards(battle_time) # 該当する手札をA,J,Q,Kに変換

      puts "戦争！"
      #p battle_time
      #p @player1, @player2
      puts "プレイヤー1のカードは#{@player1[battle_time][0]}の#{@player1[battle_time][1]}です。"
      puts "プレイヤー2のカードは#{@player2[battle_time][0]}の#{@player2[battle_time][1]}です。" # 手札を表示
      puts result
      # break unless @player1[battle_time][1] == @player2[battle_time][1]
    end
    p @player1
    p @player2
    p @save_player_card
    p @get_player1
    p @get_player2
    p @get_player1.length
    p @get_player2.length
  end

  def war_result(battle_time)
    if @player1[battle_time][1] == @player2[battle_time][1]
      @save_player_card << @player1[battle_time]
      @save_player_card << @player2[battle_time]
      "引き分けです。"
    elsif @player1[battle_time][1] > @player2[battle_time][1]
      unless @save_player_card.empty?
        get_cards = @save_player_card.length / 2 + 1
        @get_player1 += @save_player_card
        @save_player_card = []
        @get_player1 << @player1[battle_time]
        @get_player1 << @player2[battle_time]
        p @get_player1
        "プレイヤー1が勝ちました。プレイヤー1はカードを#{get_cards}枚もらいました。"
      else
        @get_player1 << @player1[battle_time]
        @get_player1 << @player2[battle_time]
        "プレイヤー1が勝ちました。プレイヤー1はカードを1枚もらいました。"
      end
    else
      unless @save_player_card.empty?
        get_cards = @save_player_card.length / 2 + 1
        @get_player2 += @save_player_card
        @save_player_card = []
        @get_player2 << @player1[battle_time]
        @get_player2 << @player2[battle_time]
        p @get_player2
        "プレイヤー2が勝ちました。プレイヤー2はカードを#{get_cards}枚もらいました。"
      else
        @get_player2 << @player1[battle_time]
        @get_player2 << @player2[battle_time]
        "プレイヤー2が勝ちました。プレイヤー2はカードを1枚もらいました。"
      end
    end
  end

  def change_cards(battle_time)
    change_ace(battle_time)
    change_jack(battle_time)
    change_queen(battle_time)
    change_king(battle_time)
  end

  def change_ace(battle_time)
    @player1[battle_time][1] = "A" if @player1[battle_time][1] == 14
    @player2[battle_time][1] = "A" if @player2[battle_time][1] == 14
  end

  def change_jack(battle_time)
    @player1[battle_time][1] = "J" if @player1[battle_time][1] == 11
    @player2[battle_time][1] = "J" if @player2[battle_time][1] == 11
  end

  def change_queen(battle_time)
    @player1[battle_time][1] = "Q" if @player1[battle_time][1] == 12
    @player2[battle_time][1] = "Q" if @player2[battle_time][1] == 12
  end

  def change_king(battle_time)
    @player1[battle_time][1] = "K" if @player1[battle_time][1] == 13
    @player2[battle_time][1] = "K" if @player2[battle_time][1] == 13
  end
end
