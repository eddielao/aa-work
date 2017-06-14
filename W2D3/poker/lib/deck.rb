require_relative 'card'

# Represents a deck of playing cards.
class Deck

  # Returns an array of all 52 playing cards.
  def self.all_cards
    # debugger
    Card.suits.product(Card.values).map do |s_v|
      s, v = s_v
      Card.new(s, v)
    end
  end

  def initialize(cards = Deck.all_cards)
    # debugger
    @deck = cards
  end

  # Returns the number of cards in the deck.
  def count
    @deck.size
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > @deck.size
    @deck.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @deck += cards
  end
end
