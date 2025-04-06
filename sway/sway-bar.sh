date_and_week=$(date "+%Y/%m/%d (w%-V)")
current_time=$(date "+%H:%M:%S")
loadavg_5min=$(cat /proc/loadavg | awk -F ' ' '{print $2}')

battery_status=$(cat /sys/class/power_supply/BAT1/status) 

bat_percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep  "percentage" | sed 's/percentage:          //' | sed 's/   //')


disk_used=$(df -h | grep /home | cut -f10 -d' ')
disk_free=$( df -h | grep /home | cut -f12 -d' ')
disk_percentage=$( df -h | grep /home | cut -f15 -d' ')

ram_total=$(free -h | grep Mem | cut -f13 -d' ')
ram_free=$(free -h | grep Mem | cut -f20 -d' ')
ram_percentage=$(free -h | grep Mem | awk '{print $3/$2 * 100.0}')

cpu_usage=$(top -bn1 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'| awk '{print "CPU Usage: " 100-$8 "%"}')

echo  "RAM Usage: $ram_free/$ram_total ($ram_percentage%) | $cpu_usage | Disk Usage: $disk_used/$disk_free ($disk_percentage) | Bat $battery_status$bat_percentage | $current_time"