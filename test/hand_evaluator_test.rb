require '''minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/hand_evaluator'

class HandEvaluatorTest < MiniTest::Test
  def test_it_initializes_with_two_hands_of_cards
    hand_one = '5H 5C 6S 7S KD'
    hand_two = '2C 3S 8S 8D TD'

    evaluator = HandEvaluator.new(hand_one, hand_two)

    assert_instance_of HandEvaluator, evaluator
    assert_equal evaluator.hand_one, hand_one.split(' ')
    assert_equal evaluator.hand_two, hand_two.split(' ')
  end

  def test_it_can_collect_cards_by_number
    hand_one = '5H 5C 6S 7S KD'
    hand_one_numbers = {'5' => 2, '6' => 1, '7' => 1, 'K' => 1}
    hand_two = '2C 3S 8S 8D TD'
    hand_two_numbers = {'2' => 1, '3' => 1, '8' => 2, 'T' => 1}

    evaluator = HandEvaluator.new(hand_one, hand_two)

    assert_equal hand_one_numbers, evaluator.collect_by_number(evaluator.hand_one)
    assert_equal hand_two_numbers, evaluator.collect_by_number(evaluator.hand_two)
  end
end
