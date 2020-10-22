#!/bin/bash
# baraction.sh for spectrwm status bar

## DATE
dte() {
  dte="$(date +"%A, %B %d %l:%M%p")"
  echo -e "$dte"
}

## DISK
ssd() {
  ssd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "SDD: $ssd"
}

hdd() {
  hdd="$(df -h | awk 'NR==9{print $3, $5}')"
  echo -e "HDD: $hdd"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "MEM: $mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu%"
}

## VOLUME
vol() {
    #vol=`amixer -c1 get Master | awk -F'[][]' 'END{ print $4":"$2 }' | cut -d ":" -f2`
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }'`
    echo -e "VOL: $vol"
}

wifi() {
  WIRED_STATE=`nmcli connection show --active | grep ethernet | cut -d " " -f1`
  WIRELESS_STATE=`nmcli connection show --active | grep wifi | cut -d " " -f1`
  VPN_STATE=`nmcli connection show --active | grep vpn | cut -d " " -f1`
  status="Disconnect"
  if [ ${#WIRELESS_STATE} -gt 0 ]
  then
    status="$WIRELESS_STATE ON"
  else
    status="WIRELESS OFF"
  fi
  if [ ${#WIRED_STATE} -gt 0 ] 
  then
    status="WIRED ON"
  fi
  if [ ${#VPN_STATE} -gt 0  ]
  then
    vpn="| VPN: $VPN_STATE"
  else
    vpn=""
  fi
  echo -e "$status$vpn"
} 

keyload() {
  KEYBOARD_STATE=`setxkbmap -v | grep symbols | cut -d "+" -f2`
  echo -e "${KEYBOARD_STATE^^}"
}

bitcoin() {
  value=`curl -s http://api.coindesk.com/v1/bpi/currentprice.json | python -c "import json, sys; print(json.load(sys.stdin)['bpi']['USD']['rate'])" | cut -d "." -f1`
  echo -e "$value" 
}
#---------------------------------------------------

SLEEP_SEC=5
#loops forever outputting a line every SLEEP_SEC secs
while :; do
    #echo "$(cpu) | $(mem) | $(ssd) | $(hdd) | $(vol) | $(wifi) | $(keyload) | $(dte) "
    echo "+@fg=3; $(bitcoin) | +@fg=1; $(cpu) | +@fg=2; $(mem) | +@fg=3; $(vol) | +@fg=4; $(wifi) | +@fg=0; $(keyload) |"
	sleep $SLEEP_SEC
done

