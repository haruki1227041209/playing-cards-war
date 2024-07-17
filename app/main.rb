require_relative 'cards'
require_relative 'war_function'

game = WarFunction.new
puts "戦争を開始します。"
#cards.all_cards #トランプ全種の作成
puts "カードが配られました。"
#cards.shuffle_cards #プレイヤーにカードを配る

game.war
