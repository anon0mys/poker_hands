require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/hand'
require './lib/round'

class RoundTest < MiniTest::Test
  def test_it_initializes_with_two_hands
    player_one_cards = '5H 5C 6S 7S KD'
    player_two_cards = '2C 3S 8S 8D TD'

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_instance_of Round, round
    assert_instance_of Hand, round.player_one
    assert_instance_of Hand, round.player_two
  end

  def test_it_can_rank_by_highest_pair
    player_one_cards = '5H 5C 6S 7S KD'
    player_two_cards = '2C 3S 8S 8D TD'

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_equal 'Player 2', round.determine_winner
  end

  def test_it_can_rank_by_highest_card
    player_one_cards = '5D 8C 9S JS AC'
    player_two_cards = '2C 5C 7D 8S QH'

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_equal 'Player 1', round.determine_winner
  end
end
