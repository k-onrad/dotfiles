#!/usr/bin/fish

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null
	sleep 1
end

function launch_bar
	env MONITOR=$argv[1] polybar $argv[2] &
end

for screen in (xrandr --query | rg -w connected)
	set output (string split -m 1 " " $screen)[1]
  	printf "Found output: %s\n" $output
	switch $screen
		case (string match '*primary*' $screen)
			launch_bar $output top-main
		case *
			launch_bar $output top-secondary
	end
end