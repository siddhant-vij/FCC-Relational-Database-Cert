#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Print welcome message
echo -e "\n~~ Number Guessing Game ~~\n"

# Function to handle the main menu actions
main_menu() {
  echo "Enter your username:"
  read USERNAME

  # Check for existing user
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  if [[ -z $USER_ID ]]
  then
    # New user welcome message
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    # Insert new user into database
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    # Retrieve new user ID
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  else
    # Existing user welcome message
    print_user_info
  fi
  # Start the game
  game
}

# Function to print user information
print_user_info() {
  USER_INFO=$($PSQL "SELECT u.username, COUNT(g.game_id) AS games_played, MIN(g.number_of_guesses) AS best_game FROM users u LEFT JOIN games g ON u.user_id = g.user_id WHERE u.user_id = $USER_ID GROUP BY u.username")
  echo "$USER_INFO" | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
}

# Function to handle guessing game logic
game() {
  # Generate random number
  RANDOM_NUMBER=$((1 + $RANDOM % 1000))
  NUMBER_OF_GUESSES=0
  echo "Guess the secret number between 1 and 1000:"

  # Read and validate user guess
  read_and_validate_guess

  # Main game loop
  while [[ $USER_GUESS -ne $RANDOM_NUMBER ]]
  do
    # Provide hints for next guess
    if [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

    # Read and validate next guess
    read_and_validate_guess
  done

  # User has guessed the number
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  # Insert the new game result as a row in the games table
  insert_game_result
}

# Function to read and validate user guess
read_and_validate_guess() {
  read USER_GUESS
  while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read USER_GUESS
  done
}

# Function to insert a new game with the number of guesses
insert_game_result() {
  INSERT_NEW_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
}

# Start the main menu
main_menu
