# .bash_profile
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export PATH=$HOME/.local/bin:$PATH
