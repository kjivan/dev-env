# Kavi's Development Environment

Feel free to fork and manipulate the repo as you see fit. If you think I'll like something feel free to submit a pull request.

## Scripts
- dev-env/configure-mac.bash - macos conigurations
- dev-env/install-brew-fish.bash - Install brew and fish
- dev-env/setup-dev-env.bash - Checkout kjivan dev-env as a [bare git repo](https://www.atlassian.com/git/tutorials/dotfiles) overlayed with your home directory
- dev-env/install-packages.fish - Install the packages I use most frequently (designed to be fast and idempotent)
- reindex-spotlight.fish - If spotlight isn't indexing fwr use this script
- dev-env/create-dev-env.bash - Create a dev-env bare repo (how I originally created a bare repo)

## Configs
- .config/fish/config.fish - [fish](https://fishshell.com/) shell configuration
- .config/fish/functions/fish_prompt.fish - Prompt configuration
- .tmux.conf - [tmux](https://github.com/tmux/tmux) tmux configuration
- .config/nvim/init.vim - [neovim](https://neovim.io/) configuration
- .config/alacritty/alacritty.yml - [alacritty](https://github.com/alacritty/alacritty) configuration
- .elvish/rc.elv - [elvish](elv.sh) configuration

## iTerm Theme Files
- dev-env/gruvbox-dark.itermcolors - dark theme I use with my vim gruvbox theme
- dev-env/gruvbox-light.itermcolors - If you are into light themes

## Manual Steps
- Update System
- Keyboard
    - Under *Modifier Keys...* Set Caps Lock Key to Control
    - Set *Key Repeat* to Max
    - Set *Delay Until Repeat* to Short
- Add SSH Key to github
```
curl -s https://raw.githubusercontent.com/kjivan/dev-env/master/dev-env/install-brew-and-fish | bash
curl -s https://raw.githubusercontent.com/kjivan/dev-env/master/dev-env/setup-dev-env | bash
~/dev-env/install-packages
```
- Brave
    - Install [LastPass](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)
    - Install [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
        - Copy from [google doc](https://docs.google.com/document/d/1tBjtwWiP-zOM1NK4QjnQqlKhoUCNYLijwyKi4zzTTQM/edit?usp=sharing) to vimium
    - Install [New Tab Redirect](https://chrome.google.com/webstore/detail/new-tab-redirect/icpgjfneehieebagbmdbhnlpiopdcmna)
        - Redirect to [Daily Reminders](https://jivan.cc/posts/daily-reminders/)
    - Install [React Dev Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
    - Install [Vue Dev Tools](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)
    - Install [Angular Dev Tools](https://chrome.google.com/webstore/detail/augury/elgalmkoelokbchhkhacckoklkejnhcd)
    - Install [Grammarly](https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen?hl=en)
    - Go to System Preferences -> Keyboard -> Shortcuts -> App Shortcuts
        - Add new shortcut cmd + ctrl + t to `Move Tab to New Window`
- Spectacle - configure shortcut keys for screen control

## Notes
In my fish config I alias **dg** to reference my dev environment bare git repo so I'm able to add configs and do typical git stuff using dg.

For example if I want to add my neovim config I would

    dg add ~/.config/nvim/init.vim

## Other References
- [Modern CLI](https://app.gitbook.com/@kjivan/s/modern-cli)
- [Rusty Terminal](https://dev.to/22mahmoud/my-terminal-became-more-rusty-4g8l)
