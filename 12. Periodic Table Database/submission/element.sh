#! /bin/bash

# Define PostgreSQL connection command
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

# Function to display a message for lack of argument
no_argument_error() {
  echo -e "\nPlease provide an element as an argument."
  exit 1
}

# Function to get element information from the database
get_element() {
  local query=""

  # Determine if the argument is an atomic number or a symbol/name and construct the query accordingly
  if [[ $1 =~ ^[1-9][0-9]*$ ]]
  then
    query="SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = '$1'"
  else
    query="SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE name = '$1' OR symbol = '$1'"
  fi

  # Fetch the element information from the database
  $PSQL "$query"
}

# Function to display element information
display_element() {
  local element_info=$1
  local element_not_found_msg="\nI could not find that element in the database."

  # Check if the element was found
  if [[ -z $element_info ]]
  then
    echo -e "$element_not_found_msg"
    exit 1
  else
    # Parse and display the element information
    echo $element_info | while IFS=" |" read an name symbol type mass mp bp 
    do
      echo -e "\nThe element with atomic number $an is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $mp celsius and a boiling point of $bp celsius."
    done
  fi
}

# Main script execution
echo -e "\n\n~~~~ Periodic Table ~~~~\n\n"

# Check for the presence of an argument
if [[ -z $1 ]]
then
  no_argument_error
  # Fix DB script can be created here & run -> clear.
fi

# Get element information based on the argument
element=$(get_element "$1")

# Display the element information
display_element "$element"
