#!/bin/sh
if [ "$(tmux display -p '#{window_panes}')" -eq 1 ]; then
  tmux split-window -v
fi
tmux setw main-pane-height $(( $(tmux display -p '#{window_height}') * 3 / 4 ))
tmux select-layout main-horizontal
