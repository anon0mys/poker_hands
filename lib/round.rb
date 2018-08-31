class Round
  attr_reader :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def determine_winner
    hand_types.each do |hand_type|
      player_one_hand = @player_one.send(hand_type)
      player_two_hand = @player_two.send(hand_type)
      compare_hands(player_one_hand, player_two_hand)
      break if @winner
    end
    @winner
  end

  def compare_hands(one_has_hand_type, two_has_hand_type)
    if one_has_hand_type && two_has_hand_type
      tie_breaker(one_has_hand_type, two_has_hand_type, one_has_hand_type.length)
    elsif one_has_hand_type
      @winner = 'Player 1'
    elsif two_has_hand_type
      @winner = 'Player 2'
    end
  end

  def tie_breaker(player_one_hand, player_two_hand, length)
    if player_one_hand.first > player_two_hand.first
      @winner = 'Player 1'
    elsif player_two_hand.first > player_one_hand.first
      @winner = 'Player 2'
    elsif length == 1
      tie_breaker(@player_one.cards, @player_two.cards, 5)
    else
      tie_breaker(player_one_hand[1..-1], player_two_hand[1..-1], length - 1)
    end
  end

  private

  def hand_types
    [
      'find_royal_flush',
      'find_straight_flush',
      'find_four_of_a_kind',
      'find_full_house',
      'find_flush',
      'find_straight',
      'find_three_of_a_kind',
      'find_pairs',
      'highest_card'
    ]
  end
end
