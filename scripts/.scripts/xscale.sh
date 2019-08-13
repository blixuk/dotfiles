#!/bin/sh

TEMP1=$(xrandr | grep eDP-1 | awk '{print $4}')
TEMP2=$(xrandr | grep DP-2-1 | awk '{print $3}')
TEMP3=$(xrandr | grep DP-2-3 | awk '{print $3}')

SCREENS=$(xrandr | grep " connected " | awk '{print$1}')


#read -p "Scale: " SCALE
#echo $(($SCALE * 2))

#START
echo "Connected screens: \n$SCREENS\n"

read -p "Enter screen name: " SELECTED

if [ "$SELECTED" = "eDP-1" ]; then
    echo "eDP-1: $TEMP1"
    H1=$(echo $TEMP1 | grep -o '[0-9]*x' | grep -o '[0-9]*')
    W1=$(echo $TEMP1 | grep -o 'x[0-9]*' | grep -o '[0-9]*')
    echo "Hight: $H1"
    echo "Width: $W1"
    read -p "Enter scaling: " SCALE
    #SH1=$(echo "$H1 * $SCALE" | bc)
    #SW1=$(echo "$W1 * $SCALE" | bc)
    SH1=$(awk 'BEGIN { a = '$H1'; b = '$SCALE'; print (a * b) }')
    SW1=$(awk 'BEGIN { a = '$W1'; b = '$SCALE'; print (a * b) }')
    echo "$H1 * $SCALE = $SH1"
    echo "$W1 * $SCALE = $SW1"
    read -p "Apply scalling? y/n: " OP
    if [ "$OP" = "y" ]; then
        xrandr --output eDP-1 --scale "$SCALE"x"$SCALE" --panning "$SH1"x"$SW1"
    else
        echo "No changes made!"
    fi
elif [ "$SELECTED" = "DP-2-1" ]; then
    echo "DP-2-1: $TEMP2"
    H2=$(echo $TEMP2 | grep -o '[0-9]*x' | grep -o '[0-9]*')
    W2=$(echo $TEMP2 | grep -o 'x[0-9]*' | grep -o '[0-9]*')
    echo "Hight: $H2"
    echo "Width: $W2"
    read -p "Enter scaling: " SCALE
    SH2=$(($H2 * $SCALE))
    SW2=$(($W2 * $SCALE))
    echo "$H2 * $SCALE = $SH2"
    echo "$W2 * $SCALE = $SW2"
elif [ "$SELECTED" = "DP-2-3" ]; then
    echo "DP-2-3: $TEMP3"
    H3=$(echo $TEMP3 | grep -o '[0-9]*x' | grep -o '[0-9]*')
    W3=$(echo $TEMP3 | grep -o 'x[0-9]*' | grep -o '[0-9]*')
    echo "Hight: $H2"
    echo "Width: $W2"
    read -p "Enter scaling: " SCALE
    SH3=$(($H3 * $SCALE))
    SW3=$(($W3 * $SCALE))
    echo "$H3 * $SCALE = $SH3"
    echo "$W3 * $SCALE = $SW3"
else
    echo "Please enter a connected screen!"
fi