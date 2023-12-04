set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR nvim

alias cp "cp -iv"
alias mv "mv -iv"
alias rm "rm -vI"
alias mkd "mkdir -pv"

alias tree "exa --tree --classify"
alias ls "exa --grid --icons --classify"
alias ll "exa --long --icons --classify"
alias la "exa --all --long --icons --classify"

set -U Z_CMD z

# ibus
set -gx GTK_IM_MODULE ibus
set -gx XMODIFIERS "@im=ibus"
set -gx QT_IM_MODULE ibus

# volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# dotnet
set -gx DOTNET_ROOT "/home/beepbeep/.dotnet"
set -gx PATH "/home/beepbeep/.dotnet" $PATH
set -gx PATH "/home/beepbeep/.dotnet/tools" $PATH
