if status is-interactive
    set -g fish_color_normal white
    set -g fish_color_param white
    set -g fish_color_option white

    abbr hx helix
    abbr n nvim
    abbr ms make setup
    abbr gs git status
    abbr c clear
end

zoxide init fish | source

test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
