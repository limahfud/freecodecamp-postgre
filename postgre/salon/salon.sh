#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

SHOW_SERVICE(){
  echo "$SERVICES" | while read SERVICE_ID BAR NAME 
  do
    echo "$SERVICE_ID) $NAME"
  done
  
  read SERVICE_ID_SELECTED
  SERVICE_AVAILABILITY=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_AVAILABILITY ]]
  then
    SHOW_SERVICE
  else 
    echo -e "\nPlease enter your phone number:"
    read CUSTOMER_PHONE
    
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nPlease enter your name:"
      read CUSTOMER_NAME
      CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
    fi
    echo -e "\nPlease service time:"
    read SERVICE_TIME

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo "I have put you down for a $(echo $SERVICE_NAME| sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME| sed -r 's/^ *| *$//g')."
  fi
}
SHOW_SERVICE
