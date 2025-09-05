# User config
alias cbt='colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure --symlink-install --parallel-workers $(nproc)'
alias cbs='colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure --symlink-install --packages-select --parallel-workers $(nproc)'
alias foxgluvv='ros2 launch foxglove_bridge foxglove_bridge_launch.xml'

export CXX=clang++
export CC=clang
bindkey -s ^f "tmux-sessionizer\n"

alias vim="vim"
alias lzg="lazygit"
alias left="xrandr --output HDMI-A-0 --auto --left-of eDP"
alias right="xrandr --output HDMI-A-0 --auto --right-of eDP"
alias top="xrandr --output HDMI-A-0 --auto --above eDP"



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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


#eval "$(register-python-argcomplete ros2)"
#eval "$(register-python-argcomplete colcon)"

alias configurathor="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
