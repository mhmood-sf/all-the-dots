#!/usr/bin/env bash
#
# Dependencies:
# - rg (ripgrep)
# - date
# - acpi
# - font awesome 6+
# - nmcli (network manager)
# - bluetoothctl (bluez)

if [ $# -ne 1 ]
then
    exit 1
fi

get_time() {
    # Prints time in HH:MM format.
    date +%H:%M
}

get_date() {
    # Prints date in the format 'Apr 30'.
    date +"%b %d"
}

get_battery() {
    # Get the battery percentage, excluding the % symbol
    # and colors/styling.
    bat=$(acpi | rg '\d+%' -o | rg '\d+' -o --color=never)

    # Check which glyph to use. First we check if the machine is charging.
    acpi | rg "Charging" > /dev/null

    # If so, $? will be 0 and [ $? ] will be true.
    if [ $? ]
    then
        batglyph=""
    # Otherwise we check the battery percentage to choose the glyph.
    elif [ $bat >= 90 ]
    then
        batglyph=""
    elif [ $bat >= 60 ]
    then
        batglyph=""
    elif [ $bat >= 40 ]
    then
        batglyph=""
    elif [ $bat >= 15 ]
    then
        batglyph=""
    else
        batlgyph=""
    fi

    echo "$batglyph $bat"
}

get_battery_plain() {
    acpi | rg '\d+%' -o --color=never
}

get_wifi() {
    # Try to get the SSID name.
    ssid=$(nmcli | head -n 1 | rg " connected " | rg '\S+$' -o --color=never)

    # If the above succeeded, print the SSID with the glyph.
    if [ $? ]
    then
        echo " $ssid"
    else
        echo " No WiFi"
    fi
}

get_wifi_plain() {
    ssid=$(nmcli | head -n 1 | rg " connected " | rg '\S+$' -o --color=never)

    if [ $? ]
    then
        echo $ssid
    else
        echo ""
    fi
}

get_bluetooth() {
    if [ $(bluetoothctl devices Connected | wc -l) -eq 0 ]
    then
        echo ""
    else
        echo ""
    fi
}

get_bluetooth_plain() {
    if [ bluetoothctl devices Connected | wc -l -eq 0 ]
    then
        echo ""
    else
        echo $(bluetoothctl devices Connected | head -n 1 | cut -d " " -f3)
    fi
}

case "$1" in
    time) get_time ;;
    date) get_date ;;
    bat)  get_battery ;;
    wifi) get_wifi ;;
    blue) get_bluetooth ;;
    *)    echo "" ;;
esac
