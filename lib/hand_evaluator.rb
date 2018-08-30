class HandEvaluator
  attr_reader :hand_one, :hand_two

  def initialize(hand_one, hand_two)
    @hand_one = hand_one.split(' ')
    @hand_two = hand_two.split(' ')
  end

  def collect_by_number(hand)
    hand.reduce(Hash.new(0)) do |collection, card|
      collection[card[0]] += 1
      collection
    end
  end

  def find_pairs(hand)
    numbers = collect_by_number(hand)
    pairs = numbers.select {|card, count| count == 2}
    pairs.keys
  end
end
