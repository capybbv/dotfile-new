set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR nvim
set -gx JAVA_HOME ~/.sdkman/candidates/java/current

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

# Automation start ssh agent
setenv SSH_ENV $HOME/.ssh/environment

function start_agent                                                                                                                                                                    
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end  
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end  
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else 
        start_agent
    end  
end

# SDKMan
function sdk
    bash -c "source '$HOME/.sdkman/bin/sdkman-init.sh'; sdk $argv[1..]"
end
