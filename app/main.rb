require_relative 'cards'

cards = Cards.new
cards.number.each do |design, numbers|
  numbers.each do |number|
    puts "#{design}の#{number}"
  end
end
puts "戦争を開始します"
