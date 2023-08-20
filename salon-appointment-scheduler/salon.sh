#!/bin/bash

PSQL='psql -X --username=freecodecamp --dbname=salon --tuples-only -c'

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  if [[ -z $SERVICES ]]
  then
    echo "Sorry, no service is available now."
  else
    echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
    do
      echo "$SERVICE_ID) $SERVICE"
    done

    read SERVICE_ID_SELECTED
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      MAIN_MENU "Please select a number."
    else
      SERVICE_FOUND=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      if [[ -z $SERVICE_FOUND ]]
      then
        MAIN_MENU "Please select a valid service number."
      else
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        CUSTOMER_NAME=$(echo $NAME | sed 's/ //g')
        # if customer is new
        if [[ -z $CUSTOMER_NAME ]]
        then
          # ask for name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          # add new customer
          INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")        
        fi
        # ask for a time for the appointment
        echo -e "\nWhat time is suitable for you?"
        read SERVICE_TIME
        # get customer id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
        # create new appointment
        INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        if [[ $INSERT_APPOINTMENT = 'INSERT 0 1' ]]
        then
          SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
          SERVICE=$(echo $SERVICE | sed 's/^ *| $*//g')
          echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
      fi
    fi
  fi
}

MAIN_MENU
