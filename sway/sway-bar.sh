date_and_week=$(date "+%Y/%m/%d (w%-V)")
current_time=$(date "+%H:%M:%S")
loadavg_5min=$(cat /proc/loadavg | awk -F ' ' '{print $2}')

battery_status=$(cat /sys/class/power_supply/BAT1/status) 

bat_percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep  "percentage" | sed 's/percentage:          //' | sed 's/   //')


echo  "Bat $battery_status$bat_percentage| $current_time"