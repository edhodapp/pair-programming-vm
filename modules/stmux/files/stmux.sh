# -*- mode: shell-script -*-
#

stmux_base=/var/stmux
stmux_conf=/etc/stmux/stmux.conf
function stmux-new() {
	if [ -S "$stmux_base/$1" ]; then
		tmux -f $stmux_conf -S $stmux_base/$1 attach
	else
		tmux -f $stmux_conf -S $stmux_base/$1 new
	fi
}

function stmux-attach() {
	tmux -f $stmux_conf -S $stmux_base/$1 attach
}

function stmux-delete() {
	if [ -S "$stmux_base/$1" ]; then
		tmux -f $stmux_conf -S $stmux_base/$1 kill-session
		rm $stmux_base/$1
	else
		echo "stmux session $1 does not exist"
	fi
}

function stmux-ls() {
	for elem in $stmux_base/* ; do
		if [ -S $elem ]; then
			echo `echo $elem | grep -E -o "/\w+$" | cut -c 2-`
		fi
	done
}

function stmux-exists() {
	if [ -S "$stmux_base/$1" ]; then
		tmux -f $stmux_conf -S $stmux_base/$1 list-sessions
	else
		echo "no sessions"
	fi
}
