INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize, Metrics/MethodLength

def display_board(brd, scr)
  system 'clear'
  puts "Welcome to Tic-Tac-Toe. Whoever wins 5 rounds is the grand winner."
  puts "You are a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  show_score(scr)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

# rubocop: enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def who_goes_first(response)
  first_letter = response.downcase[0]
  if first_letter == 'c'
    'Computer'
  elsif first_letter == 'p'
    'Player'
  else
    ['Player', 'Computer'].sample
  end
end

def player_places_piece!(brd)
  square = INITIAL_MARKER
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}): "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def joinor(arr, delimit = ', ', word = 'or')
  new_string = ''

  if arr.size == 1
    new_string = arr.first.to_s
  elsif arr.size == 2
    new_string = "#{arr.first} #{word} #{arr.last}"
  else
    arr.each_with_index do |element, index|
      new_string += "#{element}#{delimit}" unless index == arr.size - 1
      new_string += "#{word} #{element}" if index == arr.size - 1
    end
  end

  new_string
end

def computer_places_piece!(brd)
  if detect_chance(brd)
    brd[computer_offense_square(brd)] = COMPUTER_MARKER
  elsif detect_threat(brd)
    brd[computer_defense_square(brd)] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def detect_threat(brd)
  !!computer_defense_square(brd)
end

def computer_defense_square(brd)
  WINNING_LINES.each do |line|
    row = brd.values_at(line[0], line[1], line[2]) # can also use * operator
    if row.count(PLAYER_MARKER) == 2 && row.count(INITIAL_MARKER) == 1
      return brd.slice(line[0], line[1], line[2]).key(INITIAL_MARKER)
    end
  end
  nil
end

def detect_chance(brd)
  !!computer_offense_square(brd)
end

def computer_offense_square(brd)
  WINNING_LINES.each do |line|
    row = brd.values_at(line[0], line[1], line[2])
    if row.count(COMPUTER_MARKER) == 2 && row.count(INITIAL_MARKER) == 1
      return brd.slice(line[0], line[1], line[2]).key(INITIAL_MARKER)
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def show_score(scr)
  prompt "Player #{scr['Player']} vs. #{scr['Computer']} Computer"
end

def detect_final_winner(scr)
  scr.key(5)
end

def won_5rounds?(scr)
  !!detect_final_winner(scr)
end

def place_piece!(brd, turn)
  turn == 'Player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

scoreboard = { 'Player' => 0, 'Computer' => 0 }

loop do # main loop
  loop do # 5-round game loop
    board = initialize_board

    prompt "Who goes first? (Enter p for player or c for computer)"
    prompt "An invalid response will randomly select the first player."
    response = gets.chomp

    current_player = who_goes_first(response)

    loop do
      display_board(board, scoreboard)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, scoreboard)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      scoreboard[detect_winner(board)] += 1
    else
      prompt "It's a tie!"
    end

    sleep 1

    if won_5rounds?(scoreboard)
      prompt "The final score is..."
      show_score(scoreboard)
      prompt "#{detect_final_winner(scoreboard)} is the grand winner!"
      break
    end
  end

  prompt "\n"
  prompt "Play again? (y or n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing tic-tac-toe! Good bye."
