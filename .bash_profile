if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.setup_proxy.bash ]; then
   source ~/.setup_proxy.bash
fi


export PATH="$HOME/.poetry/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/kavijivan/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/kavijivan/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/kavijivan/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/kavijivan/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
