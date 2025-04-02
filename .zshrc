# User config
alias cbt='colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure --symlink-install --parallel-workers $(nproc)'
alias cbs='colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure --symlink-install --packages-select --parallel-workers $(nproc)'
alias foxgluvv='ros2 launch foxglove_bridge foxglove_bridge_launch.xml'

alias vim="nvim"
alias lzg="lazygit"
alias left="xrandr --output HDMI-A-0 --auto --left-of eDP"
alias right="xrandr --output HDMI-A-0 --auto --right-of eDP"
alias top="xrandr --output HDMI-A-0 --auto --above eDP"

export CXX=clang++
export CC=clang
bindkey -s ^f "tmux-sessionizer\n"


# # fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.
if [[ ! -e ~/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
  zcompile-many ~/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi
if [[ ! -e ~/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/zsh-autosuggestions
  zcompile-many ~/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi
if [[ ! -e ~/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  make -C ~/powerlevel10k pkg
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /opt/intel/oneapi/setvars.sh > /dev/null
eval "$(zoxide init zsh)"
#
setxkbmap -layout us,ca -option -option grp:win_space_toggle

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source /opt/ros/jazzy/setup.zsh
source /home/nicolaslauzon/ros2_ws/install/setup.zsh



alias configurathor="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

export QT_PLUGIN_PATH=$(qmake -query QT_INSTALL_PLUGINS)
export QML2_IMPORT_PATH=/usr/lib/x86_64-linux-gnu/qt5/qml
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins/platforms

eval "$(register-python-argcomplete ros2)"
eval "$(register-python-argcomplete colcon)"

export PATH="/home/nicolaslauzon/flutter/bin:${PATH}"
. "/home/nicolaslauzon/.deno/env"

# export PYTHONPATH=/home/nicolaslauzon/.pyenv/versions/ros2/lib/python3.12/site-packages:$PYTHONPATH
alias ifconfig="ip -c a | sed -e 's/\// \//g'" 
