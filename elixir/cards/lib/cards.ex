defmodule Cards do
  @module_doc """
    Provides a full API to play with cards
  """

  @doc """
    Return a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
  
    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end
  end 

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Verify wether if a deck contains a given card.

    ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and remainder of a deck.
    The `hand_size` argument indicates how many cards should be in the hand 
    
  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      iex> 
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)

    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary 
      {:error, _reason} -> "Something went wrong"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end
end