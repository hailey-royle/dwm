status_volume() {
	local volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
	local playback=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
	if [[ $playback == no ]]; then
		echo "vol: $volume"
	else
		echo "vol: mute"
	fi
}

status_battery() {
        local battery=$(cat /sys/class/power_supply/BAT0/capacity)
        echo "bat: $battery%"
}

while true; do
	xsetroot -name " $(status_volume)  $(status_battery)  $(date '+%F %T') "
	sleep 1
done
