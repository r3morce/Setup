if status is-interactive
    # Commands to run in interactive sessions can go here

    # Color settings for better readability
    set -g fish_color_normal white
    set -g fish_color_param white
    set -g fish_color_option white

    # Aliases
    alias hx='helix'
end

test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
