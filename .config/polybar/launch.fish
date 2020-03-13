#!/usr/bin/fish

# Terminate already running bar instances
killall -q -w polybar

# Wait until the processes have been shut down
while pgrep -U 1000 -x polybar >/dev/null
	sleep 1
end

function launch_bar
        fish -c 'env MONITOR=$argv[1] polybar $argv[2]'
end

for screen in (xrandr --query | rg -w connected | cut -f 1 -d " ")
  	printf "Found output: %s\n" $screen
	switch $screen
		case (string match '*primary*' $screen)
			launch_bar $output top-main
		case *
			launch_bar $output top-secondary
	end
end
