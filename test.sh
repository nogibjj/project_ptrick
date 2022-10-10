#!/usr/bin/env bash

#########
# Help
#########
Help()
{
    # Display help:
    echo "This script file aims to help users to identify the percantage of a specific feature in a file."
    echo
    echo "Syntax: scriptTemplate [-g|h]"
    echo "options:"
    echo "h     Print this Help."
    echo "f     The feature you want to explore."
    echo "d     The dataset you want to take a quick peep"
}
##########
# Main Program
##########
while getopts ":h:f:d:" option; do
    case $option in 
        h) # Display Help:
            Help
            exit;;
        f) # Get Feature
            FEATURE=$OPTARG;;
        d) # Get Dataset
            DF=$OPTARG;;
        /?) # Invalid Option:
            echo "Error: Invalid Option"
            exit;;
    esac
done 

LINES=$(grep -c $FEATURE $DF)
TOTAL=$(cat $DF | wc -l)
PERCENTAGE=$(echo "$LINES / $TOTAL *100" | bc -l)
echo " We have total $TOTAL lines containing feature $FEATURE in the file."
echo " We have $PERCENTAGE % of data containing feature $FEATURE."


