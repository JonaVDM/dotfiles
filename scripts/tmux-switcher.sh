# Inspired by:
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer
# needs to have fzf installed

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Code -mindepth 1 -maxdepth 5 -type d -name '.git' -exec dirname {} \; | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $tmux_running ]]; then
  tmux new -s $selected_name -c $selected
  exit 0
fi

tmux has-session -t=$selected_name 2> /dev/null
if [[ $? == 1 ]]; then
  if [[ -z $TMUX ]]; then
    tmux new -s $selected_name -c $selected
    exit 0
  fi
  tmux new-session -d -s $selected_name -c $selected
else 
  if [[ -z $TMUX ]]; then
    tmux attach -t $selected_name
    exit 0
  fi
fi
tmux switch-client -t $selected_name
