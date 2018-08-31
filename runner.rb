require './lib/hand'
require './lib/round'
require 'pry'

total_wins = File.readlines('./poker.txt').reduce(Hash.new(0)) do |win_tracker, line|
  cards = line.chomp.split(' ')
  player_one_cards = cards[0..4]
  player_two_cards = cards[5..-1]

  player_one = Hand.new(player_one_cards)
  player_two = Hand.new(player_two_cards)

  round = Round.new(player_one, player_two)
  winner = round.determine_winner

  win_tracker[winner] += 1
  win_tracker
end

puts "Player 1 wins: #{total_wins['Player 1']}"
puts "Player 2 wins: #{total_wins['Player 2']}"
