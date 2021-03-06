export GOPATH="$HOME/Source/Golang"
if [ $LANG == "en_US.UTF-8" ]
then
	schar=$'\e[0;32m\u2713\e[0m'
	fchar=$'\e[0;31m\u2717\e[0m'
else
	schar="\e[1;32m+\e[0m"
	fchar="\e[1;31mx\e[0m"
fi

export PS1='[`if [[ \$? -eq 0 ]]; then echo $schar; else echo $fchar ; fi`][\h:\u] \e[1m\w\e[0m \n\$ '

[[ -n $TMUX ]] && export TERM='screen-256color'

# Homebrew on OS X 
if [ -f /usr/local/bin/brew ] 
then 
	    export PATH="/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
		#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
		alias ls='ls --color'
fi

# Or perhaps MacPorts
if [ -f /opt/local/bin/port ]
then
	export PATH="/opt/local/bin:/opt/local/libexec/gnubin:$PATH"
	export MANPATH="/opt/local/share/man:$MANPATH"
	alias ls='ls --color'
elif [ -d /opt/local/bin ]
then
	export PATH="/opt/local/bin:$PATH"
fi

export PATH=/usr/local/bin:$PATH:~/bin

[[ -x $(which mvim) ]] && export EDITOR='/usr/local/bin/mvim -f' 
[[ -x /usr/local/bin/virtualenvwrapper.sh ]] && \

	. /usr/local/bin/virtualenvwrapper.sh

#if [ -s "$HOME/.rvm/scripts/rvm" ]
#then
#	. "$HOME/.rvm/scripts/rvm" # Load RVM function
#
#	export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#fi


#[[ -f ~/perl5/perlbrew/etc/bashrc ]] && source ~/perl5/perlbrew/etc/bashrc


# Todo.txt support
function init_todo {
	alias t="/usr/local/bin/todo" 
	alias tlw="t ls @work"
	alias tl="t ls"
	alias ta="t a"
}

[[ -x /usr/local/bin/todo ]] && init_todo
