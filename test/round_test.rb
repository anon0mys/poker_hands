require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/hand'
require './lib/round'

class RoundTest < MiniTest::Test
  def test_it_initializes_with_two_hands
    player_one_cards = %w[5H 5C 6S 7S KD]
    player_two_cards = %w[2C 3S 8S 8D TD]

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_instance_of Round, round
    assert_instance_of Hand, round.player_one
    assert_instance_of Hand, round.player_two
  end

  def test_it_can_rank_by_highest_card_of_same_type_of_hand
    player_one_cards = %w[5H 5C 6S 7S KD]
    player_two_cards = %w[2C 3S 8S 8D TD]

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_equal 'Player 2', round.determine_winner
  end

  def test_it_can_rank_by_highest_card
    player_one_cards = %w[5D 8C 9S JS AC]
    player_two_cards = %w[2C 5C 7D 8S QH]

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_equal 'Player 1', round.determine_winner
  end

  def test_it_can_rank_by_better_hand
    player_one_cards = %w[2D 9C AS AH AC]
    player_two_cards = %w[3D 6D 7D TD QD]

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_equal 'Player 2', round.determine_winner
  end

  def test_it_can_break_tied_hands_with_highest_card
    player_one_cards = %w[4D 6S 9H QH QC]
    player_two_cards = %w[3D 6D 7H QD QS]

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_equal 'Player 1', round.determine_winner
  end

  def test_it_can_rank_by_best_set_of_cards
    player_one_cards = %w[2H 2D 4C 4D 4S]
    player_two_cards = %w[3C 3D 3S 9S 9D]

    player_one = Hand.new(player_one_cards)
    player_two = Hand.new(player_two_cards)

    round = Round.new(player_one, player_two)

    assert_equal 'Player 1', round.determine_winner
  end
end
