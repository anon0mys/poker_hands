class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards.split(' ')
  end

  def number_collection
    @number_collection ||= @cards.reduce(Hash.new(0)) do |collection, card|
      collection[card[0]] += 1
      collection
    end
  end

  def find_pairs
    pairs = number_collection.select {|card, count| count == 2}
    pairs.keys
  end

  def find_three_of_a_kind
    triplets = number_collection.select {|card, count| count == 3}
    triplets.keys
  end
end
