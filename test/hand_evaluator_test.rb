require 'minitest/autorun'
require 'minitest/pride'
require './lib/hand_evaluator'

class HandEvaluatorTest < MiniTest::Test
  def test_it_initializes_with_two_hands_of_cards
    hand_one = '5H 5C 6S 7S KD'
    hand_two = '2C 3S 8S 8D TD'

    evaluator = HandEvaluator.new(hand_one, hand_two)

    assert_instance_of HandEvaluator, evaluator
    assert_equal evaluator.hand_one, hand_one
    assert_equal evaluator.hand_two, hand_two
  end
end
