function add_abbr $argv
	set -l abbr ""
	set -l command ""
	set -l binary ""
	if test (count $argv) = 2
		set binary $argv[1]
		set abbr $argv[1]
		set command $argv[2]
	else if test (count $argv) = 3
		set binary $argv[1]
		set abbr $argv[2]
		set command $argv[3]
	else
		echo "Bad call to add_abbr: [ $argv ]" 1>&2
		return
	end

	which $binary > /dev/null 2> /dev/null
	if test $status -eq 0
		abbr $abbr $command
	end
end

# Pacaur shortcuts
add_abbr 'yay' pa  'yay'
add_abbr 'yay' pas 'yay -Suy'
add_abbr 'yay' par 'yay -Rns'
add_abbr 'yay' pss 'yay -Ss'
add_abbr 'yay' pql 'yay -Ql'

# Git shortcuts
add_abbr 'git' gs  'git status'
add_abbr 'git' ga  'git add'
add_abbr 'git' gap 'git add -p'
add_abbr 'git' gc  'git commit --verbose --gpg-sign'
add_abbr 'git' gcb 'git checkout -b'
add_abbr 'git' gp  'git push'
add_abbr 'git' gpu 'git pull'
add_abbr 'git' gb  'git branch'
add_abbr 'git' gd  'git diff'
add_abbr 'git' gl  'git lg'
add_abbr 'git' glp 'git lg -p'
add_abbr 'git' gdc 'git diff --cached'

add_abbr spectro spectro 'spectro --local --parallel'
