#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


INPUT=$1

# if there is an input
if [[ -z $INPUT ]]
then
  echo -e "Please provide an element as an argument."
else
  # if input is a number
  if [[ $INPUT =~ ^[0-9]*$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$INPUT")
    # if inputted numebr is valid
    if [[ ! -z $ATOMIC_NUMBER ]]
    then
      # get all info
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
      TYPE=$($PSQL "SELECT type FROM properties inner join types using(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      # print output
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    else
      echo -e "I could not find that element in the database."
    fi
  else
    # if input is not a number
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$INPUT'")
    # if input is valid symbol
    if [[ ! -z $SYMBOL ]]
    then
      # get all info
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT'")
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
      TYPE=$($PSQL "SELECT type FROM properties inner join types using(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      # print output
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    # if input is a valid name
    elif [[ ! -z $($PSQL "SELECT name FROM elements WHERE name='$INPUT'") ]]
    then
      # get all info
      NAME=$INPUT
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$INPUT'")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
      TYPE=$($PSQL "SELECT type FROM properties inner join types using(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      # print output
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    else
      echo -e "I could not find that element in the database."
    fi
  fi  
fi