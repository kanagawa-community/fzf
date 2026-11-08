# Preview hook for .github/scripts/render-previews.sh: fzf runs in a headless tmux
# pane with each theme applied, over a fixed file list, with a query set and two
# entries marked, so the match, selection, pointer, marker and header colors show.
# Requires: fzf, tmux.
# shellcheck shell=bash
name=fzf

cleanup() {
  tmux -L kanagawa-preview kill-server 2>/dev/null || true
}

capture() {
  cleanup
  sleep 0.5
  tmux -L kanagawa-preview new-session -d -s s -x 80 -y 12 -c "$root" \
    -e FZF_DEFAULT_OPTS_FILE="$root/themes/kanagawa-$1.opts" -e COLORTERM=truecolor \
    -e TERM=xterm-256color -e LC_ALL=C \
    "fzf --multi --layout reverse --height 100% --border --border-label ' files ' --info inline-right --header 'Tab marks, Enter opens' --prompt '❯ ' --query kana --bind 'load:toggle+down+toggle' < scripts/fixtures/files.txt"
  sleep 1.5
  tmux -L kanagawa-preview capture-pane -p -e -t s >"$2"
}
