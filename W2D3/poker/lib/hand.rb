require 'byebug'

class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    aces = 0
    @cards.each do |card|
      if card.value == :ace
        points += 1
        aces += 1
      else
        points += card.blackjack_value
      end
    end
    aces.times { points += 10 if points + 10 <= 21 }
    points
  end

  # def busted?
  #   return false if points <= 21
  #   true
  # end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    # debugger
    if other_hand.busted?
      difference = points
    else
      difference = points - other_hand.points
    end

    if difference == 0 || busted?
      return false
    elsif difference > 0
      return true
    else
      return false
    end
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
