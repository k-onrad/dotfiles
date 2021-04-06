#!/usr/bin/fish
function launch_bar
  env MONITOR=$argv[1] polybar --reload $argv[2] &
end

set QUERY (xrandr --query | rg -w connected | cut -f 1 -d " ")

for SCREEN in $QUERY
  printf "Found screen: %s\n" $SCREEN
  switch $SCREEN
    case eDP1
      if contains HDMI1 $QUERY
        launch_bar $SCREEN top-secondary
      else
        launch_bar $SCREEN top-main
      end
    case '*'
      launch_bar $SCREEN top-main
  end
end
