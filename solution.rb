require "pry"

class Deck
  attr_reader :cards
  @@all = []

  def self.all
    @@all
  end
  #initialize a new dock with an array of card objects
  def initialize(cards)
    @cards = cards
    self.class.all << self
  end

  #choose a random card object from a deck object, remove it and return the removed card object
  def choose_card
    chosen_card = self.cards.sample
    self.cards.delete(chosen_card)
  end
end

class Card
  attr_accessor :rank, :suit

  @@all = []

  def self.all
    @@all
  end
  #initialize a new card object with suit and rank
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    self.class.all << self
  end

  #create a deck of 52 card objects
  def self.create_deck(ranks, suits)
    ranks.map do |rank|
      suits.map do |suit|
        self.new(suit, rank)
      end
    end.flatten
  end

end

#tests
ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
suits = ["Hearts", "Clubs", "Diamonds", "Spades"]
cards = Card.create_deck(ranks, suits)
new_deck = Deck.new(cards)
chosen_card = new_deck.choose_card
puts "Card #{chosen_card.inspect} has been removed\n\n"

#is the chosen_card in the deck? if false == cards is not there
puts new_deck.cards.include?(chosen_card)
