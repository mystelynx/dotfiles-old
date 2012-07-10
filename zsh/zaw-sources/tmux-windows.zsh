#
# zaw-src-tmux
#
# select tmux-window
#

function zaw-src-tmux-windows() {
    local no name
    tmux list-windows | \
        while read no name; do
            candidates+=("${no%:}")
            cand_descriptions+=("${no} ${name}")
        done
        actions=('zaw-callback-tmux-windows')
        act_descriptions=('select window')
}

zaw-register-src -n tmux-windows zaw-src-tmux-windows


function zaw-callback-tmux-windows() {
    tmux select-window -t $1
}
