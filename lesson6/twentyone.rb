# rubocop : disable Style/ConditionalAssignment

# Data structure

WHATEVER_ONE = 'Thirty-One'
GAME_GOAL = 31
DEALER_LIMIT = 27
SUITS = %w(H C D S)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

# msg prompt
def prompt(msg)
  puts "=> #{msg}"
end

# initialize deck
def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [suit, value]
    end
  end
  deck
end

# pick & deal card
def pick_card(deck)
  card = deck.sample
  deck.delete(card)
  card
end

# calculate total sum of values
def total(cards)
  values = cards.map(&:last)

  sum = 0
  values.each do |value|
    if %w(J Q K).include?(value)
      sum += 10
    elsif value == 'A'
      sum += 11
    else
      sum += value.to_i
    end
  end

  values.count('A').times do
    sum -= 10 if sum > GAME_GOAL
  end

  sum
end

# return winner
def who_won(dealer_total, player_total)
  if GAME_GOAL - dealer_total < GAME_GOAL - player_total
    :dealer
  elsif dealer_total == player_total
    :tie
  else
    :player
  end
end

# display result
def show_result(dealer_total, player_total)
  case who_won(dealer_total, player_total)
  when :dealer then prompt "Dealer wins!"
  when :player then prompt "You win!"
  when :tie then prompt "It's a tie!"
  end
end

# check if sum exceeds 21
def busted?(total)
  total > GAME_GOAL
end

# ask if play again
def play_again?
  prompt "=================================================="
  prompt "Do you want to play again? (y/n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# display cards in a string
def convert_cards(cards, punct = ", ") 
  # [['H', '1']] => '1 of Hearts'
  # [['H', '1'], ['D', '2']] => '1 of Hearts and 2 of Diamonds'
  # [['H', '1'], ['D', '2'], ['S', 'A']] => '1 of Hearts, 2 of Diamonds, and Ace of Spades'
  str_cards = cards.map { |card| convert_card(card) }
  
  if cards.size == 1
    str_cards.join
  else
    str_cards.last.prepend('and ')
    if cards.size == 2
      str_cards.join(" ")
    else
      str_cards.join(punct)
    end
  end
end

def convert_card(card) # ['H', '1'] => ['1 of Hearts']
  card = card.map do |element|
          case element
          when 'H' then element.sub('H', 'Hearts')
          when 'C' then element.sub('C', 'Clubs')
          when 'D' then element.sub('D', 'Diamonds')
          when 'S' then element.sub('S', 'Spades')
          when 'J' then element.sub('J', 'Joker')
          when 'Q' then element.sub('Q', 'Queen')
          when 'K' then element.sub('K', 'King')
          when 'A' then element.sub('A', 'Ace')
          else element
          end
        end
  card.reverse.join(" of ")
end

# game starts
prompt "Welcome to the game of #{WHATEVER_ONE}!"
prompt "Whoever wins 5 rounds first is the winner."
prompt "Ready to play...?"
sleep 1

loop do
  prompt "Let's play."

  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << pick_card(deck)
    dealer_cards << pick_card(deck)
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "The dealer has #{convert_card(dealer_cards.first)} and a unknown card."
  prompt "You have #{convert_cards(player_cards)}."

  loop do
    player_answer = nil
    loop do # player turn
      prompt "Hit or stay?"
      player_answer = gets.chomp.downcase
      break if ['hit', 'stay'].include?(player_answer)
      prompt "Please enter 'hit' or 'stay'."
    end

    if player_answer == 'hit'
      player_cards << pick_card(deck)
      prompt "You chose to hit!"
      prompt "Your cards are now #{convert_cards(player_cards)}."
      player_total = total(player_cards)
      prompt "Your total is now #{player_total}."
    end

    break if player_answer == 'stay' || busted?(player_total)
  end

  if busted?(player_total)
    prompt "=================================================="
    prompt "You busted, Dealer wins!"
    play_again? ? next : break
  else
    prompt "You chose to stay at #{player_total}."
  end

  prompt "Dealer's turn now..."

  loop do # Dealer's turn
    break if dealer_total >= DEALER_LIMIT || busted?(dealer_total)
    prompt "Dealer hits!"
    dealer_cards << pick_card(deck)
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now #{convert_cards(dealer_cards)}."
    prompt "Dealer's total is now #{dealer_total}."
    sleep 1
  end

  # Compare cards, determine winner, display scores
  if busted?(dealer_total)
    prompt "=================================================="
    prompt "Dealer busted, You won!"
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}."
    prompt "=================================================="
    show_result(dealer_total, player_total)
  end

  break unless play_again?
end

prompt "Good game. Good bye!"
