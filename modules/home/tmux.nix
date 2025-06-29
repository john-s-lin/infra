{ ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # Settings
      set -g mouse on
      set -g history-limit 10000

      # Keybinds
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Vim bindings in scroll-mode
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi V send -X select-line
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      # Set new panes to open in the current directory
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"

      # Status bar
      set -g status-style bg=default
      set -g status-fg green
    '';
  };
}
