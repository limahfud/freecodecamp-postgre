#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
INSERT_TEAM_IF_NOT_EXIST() {
  TEAM_NAME=$1
  echo $TEAM_NAME
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  if [[ -z $TEAM_ID ]]
  then
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM_NAME')")
    if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into team, $TEAM_NAME
    fi
  fi
}


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]
  then
    INSERT_TEAM_IF_NOT_EXIST "$WINNER"
    INSERT_TEAM_IF_NOT_EXIST "$OPPONENT"
  fi

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
  if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into game, $WINNER vs $OPPONENT
  fi
done

