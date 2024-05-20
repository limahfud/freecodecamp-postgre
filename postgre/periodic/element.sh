#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else 
  QUERY_RESULT=$($PSQL "SELECT elements.atomic_number, symbol, name, thetype, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM elements LEFT JOIN properties USING (atomic_number) WHERE elements.atomic_number::text = '$1' OR symbol = '$1' OR name = '$1';")

  if [[ -z $QUERY_RESULT ]]
  then
    echo "I could not find that element in the database."
  else 
    echo "$QUERY_RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
  
fi

