#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")
# if username exists
if [[ ! -z $USER_ID ]]
then
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
# if username does not exist
else
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME')")
fi

# generate variables for the new game
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  # input is not valid
  then
    echo -e "\nThat is not an integer, guess again:"
  # input is valid
  else
    if [[ $USER_GUESS < $SECRET_NUMBER ]]
    then
      echo -e "It's higher than that, guess again:"
    else
      echo -e "It's lower than that, guess again:"
    fi
  fi
  # in all cases ask again and add the guess count
  read USER_GUESS
  ((GUESS_COUNT++)) 
done

((GUESS_COUNT++))

USER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES ($USER_ID, $SECRET_NUMBER, $GUESS_COUNT)")

echo -e "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"