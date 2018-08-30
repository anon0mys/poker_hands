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

  def find_straight
    sorted = sort_cards
    high_card = sorted.last
    (0...sorted.length - 1).each do |index|
      if sorted[index] + 1 != sorted[index + 1]
        return nil
      end
    end
    if face_values.values.include?(high_card)
      [face_values.key(high_card)]
    else
      [high_card.to_s]
    end
  end

  def sort_cards
    numbers = number_collection.keys.map do |number|
      if face_values.keys.include?(number)
        face_values[number]
      else
        number.to_i
      end
    end
    numbers.sort
  end

  def face_values
    {
      'T' => 10,
      'J' => 11,
      'Q' => 12,
      'K' => 13,
      'A' => 14
    }
  end
end
