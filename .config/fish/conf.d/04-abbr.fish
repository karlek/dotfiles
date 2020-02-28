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
add_abbr 'yay' ya  'yay'
add_abbr 'yay' yas 'yay -Suy'
add_abbr 'yay' yar 'yay -Rns'
add_abbr 'yay' yss 'yay -Ss'
add_abbr 'yay' yql 'yay -Ql'

# Git shortcuts
add_abbr 'git' gs   'git status'
add_abbr 'git' ga   'git add'
add_abbr 'git' gaf  'git add -f'
add_abbr 'git' gap  'git add -p'
add_abbr 'git' gc   'git commit --verbose --gpg-sign'
add_abbr 'git' gco  'git checkout'
add_abbr 'git' gcb  'git checkout -b'
add_abbr 'git' gp   'git push'
add_abbr 'git' gpb  'git push origin (b)'
add_abbr 'git' gpu  'git pull --rebase --autostash --gpg-sign origin master'
add_abbr 'git' gb   'git branch'
add_abbr 'git' gd   'git diff'
add_abbr 'git' gr   'git reset'
add_abbr 'git' grb  'git rebase'
add_abbr 'git' grbc 'git rebase --continue'
add_abbr 'git' grbo 'git rebase origin/master'
add_abbr 'git' gl   'git lg'
add_abbr 'git' glp  'git lg -p'
add_abbr 'git' gf   'git fetch'
add_abbr 'git' gfo  'git fetch origin'
add_abbr 'git' gdc  'git diff --cached'
add_abbr 'ecn' echo 'echo -n'

add_abbr 'echo' ecn 'echo -n'
add_abbr 'base64' 64d 'base64 -d'
add_abbr 'base64' 64e 'base64'
abbr urld 'urldecode'

add_abbr spectro spectro 'spectro --local --parallel'
add_abbr nvim v 'vim'
