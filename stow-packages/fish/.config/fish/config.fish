if status is-interactive
    set -g fish_color_normal white
    set -g fish_color_param white
    set -g fish_color_option white

    abbr hx helix
    abbr n nvim
    abbr ms make setup
    abbr gs git status
    abbr c clear
    abbr ddd 'rm -rf ~/Library/Developer/Xcode/DerivedData/*'
    abbr off 'shutdown -h now'
end

zoxide init fish | source
# eval (~/.local/try.rb init ~/src/tries | string collect)

test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

alias cp 'cp -g'
alias mv 'mv -g'
