# Start X at login
if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

# Setup kitty + fish
kitty + complete setup fish | source

# Setup virtualfish
eval (python -m virtualfish auto_activation global_requirements)
