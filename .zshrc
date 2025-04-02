# User config
alias cbt='colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure --symlink-install --parallel-workers $(nproc)'
alias cbs='colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure --symlink-install --packages-select --parallel-workers $(nproc)'
alias foxgluvv='ros2 launch foxglove_bridge foxglove_bridge_launch.xml'

export CXX=clang++
export CC=clang
bindkey -s ^f "tmux-sessionizer\n"

alias vim="nvim"
alias lzg="lazygit"
alias left="xrandr --output HDMI-A-0 --auto --left-of eDP"
alias right="xrandr --output HDMI-A-0 --auto --right-of eDP"
alias top="xrandr --output HDMI-A-0 --auto --above eDP"



# PATH="$PATH":"$HOME/.local/scripts/"

# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source /opt/ros/jazzy/setup.zsh

eval "$(register-python-argcomplete ros2)"
eval "$(register-python-argcomplete colcon)"

export QT_PLUGIN_PATH=$(qmake -query QT_INSTALL_PLUGINS)
export QML2_IMPORT_PATH=/usr/lib/x86_64-linux-gnu/qt5/qml
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins/platforms

source /opt/intel/oneapi/setvars.sh > /dev/null

alias configurathor="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

eval "$(zoxide init zsh)"

alias ifconfig="ip -c a | sed -e 's/\// \//g'" 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
