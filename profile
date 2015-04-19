# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# Fancy bash prompt
# export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#
# This is a simple, clean PS1 with current git branch displayed.
# How will look like:
#
# Î» ~/home/project (master) 
#
# NOTE: You may have to configure your terminal to support UTF-8 Unicode (so Î» will displayed correctly)


function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  WHITE="\[\033[1;37m\]"
  YELLOW="\[\033[1;33m\]"
  NO_COLOUR="\[\033[0m\]"
  GREEN="\[\033[1;32m\]"

  PS1="\[\033[1;37m\]λ $GREEN\w$YELLOW\$(parse_git_branch)$NO_COLOUR "
