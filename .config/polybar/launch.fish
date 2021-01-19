#!/usr/bin/fish

# Terminate already running bar instances
killall -qw polybar

# Wait until the processes have been shut down
while pgrep -U 1000 -x polybar >/dev/null
	sleep 1
end

function launch_bar
        fish -c "env MONITOR=HDMI1 polybar top-main"
end

for screen in (xrandr --query | rg -w connected | cut -f 1 -d " ")
  	printf "Found screen: %s\n" $screen
	switch $screen
		case (string match 'eDP1' $screen)
			launch_bar
		case *
			launch_bar $screen top-secondary
	end
end
