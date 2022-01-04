{ config, pkgs, ... }:

{
  # configure tmux
  programs.tmux = {
  enable = true;
  clock24 = true;
  extraTmuxConf = '' # used for less common options, intelligently combines if defined in multiple places.
    # enable vi keys.
setw -g mode-keys vi

# Scrollback buffer n lines
set -g history-limit 10000

bind Escape copy-mode
bind-key -T copy-mode-vi v send -X begin-selection
unbind p
bind p paste-buffer

# Prefix Ctrl-C takes what's in the buffer and sends it to system clipboard
# via xclip
bind M-c run "tmux save-buffer - | xclip -sel clip -i"

# y in copy mode takes selection and sends it to system clipboard via xclip
#bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -sel clip -i"

# Prefix Ctrl-v fills tmux buffer from system clipboard via xclip, then
# pastes from buffer into tmux window
#bind M-v run "tmux set-buffer \"$(xclip -sel clip -o)\"; tmux paste-buffer"


# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
# remap prefix from 'C-b' to 'M-a'(Alt+a)
unbind C-b
set-option -g prefix M-a
bind-key M-a send-prefix
# reload config file (change file location to your the tmux.conf you want to use)
#bind r source-file ~/.tmux.conf \; display "Reloaded!"
# setting the delay between prefix and command
set -s escape-time 1
# set the repoeat-time by default it is 500 ms
set -g repeat-time 1000
# Set the base index for panes to 1 instead of 0
setw -g pane-base-index 1
# Set the base index for windows to 1 instead of 0
set -g base-index 1
# splitting panes with | and -
bind | split-window -h
bind - split-window -v
# moving between panes with Prefix h,j,k,l
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Quick window selection
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+
# Pane resizing panes with Prefix H,J,K,L
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
# mouse support - set to on if you want to use the mouse
set -g mouse off
# Set the default terminal mode to 256color mode
set -g default-terminal "screen-256color"

# set the status line's colors
set -g status-style fg=white,bg=black

# set the color of the window list
setw -g window-status-style fg=cyan,bg=black

# set colors for the active window
setw -g window-status-current-style fg=white,bold,bg=red

# colors for pane borders
setw -g pane-border-style fg=green,bg=black
setw -g pane-active-border-style fg=white,bg=yellow

# active pane normal, other shaded out
#setw -g window-style fg=colour240,bg=colour235
#setw -g window-active-style fg=white,bg=black

# Command / message line
setw -g message-style fg=white,bold,bg=black

# Status line left side to show Session:window:pane
set -g status-left-length 40
set -g status-left "#[fg=green]Session: #S #[fg=yellow]#I #[fg=cyan]#P"

# Status line right side - cpu percentage | 97% | 31-Oct 13:37
set -g status-right "Online:#{online_status}|CPU: #{cpu_icon} #{cpu_percentage}|#(battery Discharging)|#[fg=cyan]%U %a%d%b%R"
#set -g status-right "#{cpu_bg_color} CPU: #{cpu_icon} #{cpu_percentage} | #(battery Discharging) | #[fg=cyan]%d %b %R"

# Update the status line every sixty seconds
set -g status-interval 60

# Center the window list in the status line
set -g status-justify centre

# enable activity alerts
setw -g monitor-activity on
set -g visual-activity on

# tmux and vim work well together
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

#bind C-l send-keys 'C-l'

# extending tmux with Plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
# tmux cpu and gpu status 
set -g @plugin 'tmux-plugins/tmux-cpu'
run '~/.tmux/plugins/tpm/tpm'
# online status
set -g @plugin 'tmux-plugins/tmux-online-status'
set -g @online_icon "ok"
set -g @offline_icon "offline!"
# rulview plugin
set -g @plugin 'tmux-plugins/tmux-urlview'

# tmux-yank plugin
set -g @plugin 'tmux-plugins/tmux-yank'
  '';
  };

}
