class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards.split(' ')
  end

  def highest_card
    [convert_from_value_to_card(sort_cards.last)]
  end

  def number_collection
    @number_collection ||= @cards.reduce(Hash.new(0)) do |collection, card|
      collection[card[0]] += 1
      collection
    end
  end

  def suit_collection
    @suit_collection ||= @cards.reduce(Hash.new(0)) do |collection, card|
      collection[card[1]] += 1
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

  def find_four_of_a_kind
    fours = number_collection.select {|card, count| count == 4}
    fours.keys
  end

  def find_straight
    sorted = sort_cards
    (0...sorted.length - 1).each do |index|
      if sorted[index] + 1 != sorted[index + 1]
        return nil
      end
    end
    highest_card
  end

  def find_flush
    if suit_collection.length == 1
      highest_card
    end
  end

  def find_full_house
    full_house = [find_three_of_a_kind, find_pairs]
    return nil if full_house.first.empty? || full_house.last.empty?
    full_house.flatten
  end

  def sort_cards
    values = number_collection.keys.map do |number|
      convert_from_card_to_value(number)
    end
    values.sort
  end

  private

  def convert_from_card_to_value(card)
    if face_values.keys.include?(card)
      face_values[card]
    else
      card.to_i
    end
  end

  def convert_from_value_to_card(value)
    if face_values.values.include?(value)
      face_values.key(value)
    else
      value.to_s
    end
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
