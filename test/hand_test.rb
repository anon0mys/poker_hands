require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/hand'

class HandTest < MiniTest::Test
  def test_it_initializes_with_a_hand_of_cards
    hand_one_cards = '5H 5C 6S 7S KD'
    hand_two_cards = '2C 3S 8S 8D TD'

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_instance_of Hand, hand_one
    assert_instance_of Hand, hand_two
    assert_equal hand_one.cards, hand_one_cards.split(' ')
    assert_equal hand_two.cards, hand_two_cards.split(' ')
  end

  def test_it_can_collect_cards_by_number
    hand_one_cards = '5H 5C 6S 7S KD'
    hand_one_numbers = {'5' => 2, '6' => 1, '7' => 1, 'K' => 1}
    hand_two_cards = '2C 3S 8S 8D TD'
    hand_two_numbers = {'2' => 1, '3' => 1, '8' => 2, 'T' => 1}

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal hand_one_numbers, hand_one.number_collection
    assert_equal hand_two_numbers, hand_two.number_collection
  end

  def test_it_can_find_the_highest_card
    hand_one_cards = '5H 5C 6S KD 7S'
    hand_two_cards = '2C 3S 8S 8D TD'

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal ['K'], hand_one.highest_card
    assert_equal ['T'], hand_two.highest_card
  end

  def test_it_can_find_a_single_pair
    hand_one_cards = '5H 5C 6S 7S KD'
    hand_two_cards = '2C 3S 8S 8D TD'

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal ['5'], hand_one.find_pairs
    assert_equal ['8'], hand_two.find_pairs
  end

  def test_it_can_find_two_pair
    hand_one_cards = '5H 5C 6S 7S 6D'
    hand_two_cards = '2C 2S 8S 8D TD'

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal ['5', '6'], hand_one.find_pairs
    assert_equal ['2', '8'], hand_two.find_pairs
  end

  def test_it_can_find_three_of_a_kind
    hand_one_cards = '5H 5C 5S 7S 6D'
    hand_two_cards = '8C 2S 8S 8D TD'

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal ['5'], hand_one.find_three_of_a_kind
    assert_equal ['8'], hand_two.find_three_of_a_kind
  end

  def test_it_can_sort_cards
    hand_one_cards = '5H 6C 7S 8S 9D'
    hand_one_sorted = [5, 6, 7, 8, 9]
    hand_two_cards = '9C TS JS QD KD'
    hand_two_sorted = [9, 10, 11, 12, 13]

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal hand_one_sorted, hand_one.sort_cards
    assert_equal hand_two_sorted, hand_two.sort_cards
  end

  def test_it_can_find_a_straight
    hand_one_cards = '5H 6C 7S 8S 9D'
    hand_two_cards = '9C TS JS QD KD'

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal ['9'], hand_one.find_straight
    assert_equal ['K'], hand_two.find_straight
  end

  def test_it_can_collect_cards_by_suit
    hand_one_cards = '5H 5C 6S 7S KD'
    hand_one_suits = {'H' => 1, 'C' => 1, 'S' => 2, 'D' => 1}
    hand_two_cards = '2C 3S 8S 8D TD'
    hand_two_suits = {'C' => 1, 'S' => 2, 'D' => 2}

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal hand_one_suits, hand_one.suit_collection
    assert_equal hand_two_suits, hand_two.suit_collection
  end

  def test_it_can_find_a_flush
    hand_one_cards = '5H 6H 7H QH 2H'
    hand_two_cards = '9S 2S 5S QS KS'

    hand_one = Hand.new(hand_one_cards)
    hand_two = Hand.new(hand_two_cards)

    assert_equal ['Q'], hand_one.find_flush
    assert_equal ['K'], hand_two.find_flush
  end
end
