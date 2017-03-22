#!/usr/bin/bash


# define a clock
Clock() {
        DATETIME=$(date "+%a %b %d, %Y %T")

        echo -n "$DATETIME"
}

# define the battery percentage as a green to red gradient when less
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2 | cut -c 2,3)
	if [ "$BATPERC" -gt "94" ] 
	then
	    echo "%{F#2bff00} $BATPERC"

	elif [ "$BATPERC" -gt "89" ]
	then
	    echo "%{F#55ff00} $BATPERC"
	
	elif [ "$BATPERC" -gt "84" ]
	then
	    echo "%{F#80ff00} $BATPERC"

	elif [ "$BATPERC" -gt "79" ]
	then
	    echo "%{F#aaff00} $BATPERC"

	elif [ "$BATPERC" -gt "69" ]
	then
	    echo "%{F#d5ff00} $BATPERC"

	elif [ "$BATPERC" -gt "59" ]
	then
	    echo "%{F#ffff00} $BATPERC"

	elif [ "$BATPERC" -gt "49" ]
	then
	    echo "%{F#ffd500} $BATPERC"

	elif [ "$BATPERC" -gt "39" ]
	then
	    echo "%{F#ffaa00} $BATPERC"

	elif [ "$BATPERC" -gt "29" ]
	then
	    echo "%{F#ff8000} $BATPERC"

	elif [ "$BATPERC" -gt "19" ]
	then
	    echo "%{F#ff5500} $BATPERC"

	elif [ "$BATPERC" -gt "09" ]
	then
	    echo "%{F#ff2b00} $BATPERC"
	
	else
	    echo "%{F#ff0000} $BATPERC"
	fi
}

# define the network green up arrow/red down arrow 
Network() {
	UP=$(nmcli con show --active | wc -l)
	SSID=$(nmcli con show --active | tail -n 1 | cut -d' ' -f1)
	if [ $UP != 1 ]
	then
	    echo "%{F#00ff00} ▲ $SSID"
	
	else
	    echo "%{F#ff0077} ▼ $SSID"
	fi
}



# Print 
while true; do
    echo "%{l}$(Network) %{c}%{F#FFFF00}%{B#0000FF} $(Clock) %{F-}%{B-} %{r}$(Battery)%"
    	sleep 1
done
