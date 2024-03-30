#!/bin/sh


battery() {

if [ -z $(ls /sys/class/power_supply/) ]; then
    ibat="󰚥"
    echo "$ibat AC"
    return
fi

batstat="$(cat /sys/class/power_supply/BAT0/status)"
batcap="$(cat /sys/class/power_supply/BAT0/capacity)"

if [ $batcap -le 10 ]; then
    ibat="󰁺"
elif [ $batcap -le 20 ]; then
    ibat="󰁻"
elif [ $batcap -le 30 ]; then
    ibat="󰁼"
elif [ $batcap -le 40 ]; then
    ibat="󰁽"
elif [ $batcap -le 50 ]; then
    ibat="󰁾"
elif [ $batcap -le 60 ]; then
    ibat="󰁿"
elif [ $batcap -le 70 ]; then
    ibat="󰂀"
elif [ $batcap -le 80 ]; then
    ibat="󰂁"
elif [ $batcap -le 90 ]; then
    ibat="󰂂"
elif [ $batcap -lt 100 ]; then
    ibat="󰁹"
elif [ $batcap -eq 100 ]; then
    ibat="󰂄"
fi


if [[ $batstat = "Charging" ]] && [[ $batcap -ne 100 ]]; then
    ibat+=" 󱐋"
fi

echo "$ibat $batcap%"

}


volume() {

    if [ $(pamixer --get-mute) = "true" ]; then
        ivol="󰖁"
    else
        ivol="󰕾"
    fi

    echo "$ivol $(pamixer --get-volume)%"
}


brightness() {

    ibri="󰃠"
    temp=$(light -G)
    bval=${temp%???}
    echo "$ibri $bval%"
}

cpu() {
    
    # script taken from https://stackoverflow.com/questions/26791240/how-to-get-percentage-of-processor-use-with-bash
    # Read /proc/stat file (for first datapoint)
    read cpu user nice system idle iowait irq softirq steal guest< /proc/stat

    # compute active and total utilizations
    cpu_active_prev=$((user+system+nice+softirq+steal))
    cpu_total_prev=$((user+system+nice+softirq+steal+idle+iowait))

    sleep 0.05

    # Read /proc/stat file (for second datapoint)
    read cpu user nice system idle iowait irq softirq steal guest< /proc/stat

    # compute active and total utilizations
    cpu_active_cur=$((user+system+nice+softirq+steal))
    cpu_total_cur=$((user+system+nice+softirq+steal+idle+iowait))

    # compute CPU utilization (%)
    cpu_util=$((100*( cpu_active_cur-cpu_active_prev ) / (cpu_total_cur-cpu_total_prev) ))


    icpu=""
    echo "$icpu $cpu_util%"
}

output() {

    while :; do
        echo "$(battery) | $(volume) | $(brightness) |  $(date "+%a %d-%m-%Y %R:%S %Z") | $(cpu) |  $(uptime -p | cut -d " " -f2-) |  $USER" 
        sleep 1
    done
}


output | dzen2 -p -fg "#17FC17" -bg "#000000" -fn FiraCodeNerdFontMono:style=SemiBold -h 20
