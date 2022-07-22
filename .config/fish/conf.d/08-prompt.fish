# set __toaster_color_yellow E6DB7E
# set __toaster_color_pink F92672
# set __toaster_color_grey 554F48
# set __toaster_color_white AAAAAA
# set __toaster_color_blue 9999FF
# set __toaster_color_green 99FF99

set __toaster_color_yellow yellow
set __toaster_color_pink F92672
set __toaster_color_grey 554F48
set __toaster_color_white AAAAAA
set __toaster_color_blue 7777AA
set __toaster_color_green green

function __toaster_color_echo
	set_color $argv[1]
	echo -n $argv[2]
	set_color normal
end

function __toaster_color_echo_bold
	set_color -o $argv[1]
	echo -n $argv[2]
	set_color normal
end

function __toaster_echo_bold
	set_color -o
	echo -n $argv[1]
	set_color normal
end

function __toaster_current_folder
	echo -n $PWD
end

function is_git_folder
	git rev-parse --abbrev-ref HEAD 2> /dev/null > /dev/null
	if test $status -ne 0
		echo 1
		return
	end
	echo 0
end

function __toaster_git_branch
	printf "(%s)" (git rev-parse --abbrev-ref HEAD 2> /dev/null)
end

function fish_prompt
	set -l last_pipestatus $pipestatus
	set -l last_status $status
	# Lazy cat if last command had non-zero return value.
	# Otherwise curious fat cat.
	set -l is_bad (echo -n "$last_pipestatus" | tr -d 0 | string trim | tr -d \n)
	echo -n "$is_bad" > /tmp/lol
	if test -n "$is_bad"
		echo -n "(^-.-^)ノ"
	else
		echo -n "(^._.^)ノ"
	end

	__toaster_color_echo $__toaster_color_blue " "(cat /etc/hostname)
	__toaster_color_echo $__toaster_color_grey " @ "
	__toaster_color_echo $__toaster_color_pink (__toaster_current_folder)
	if test (is_git_folder) -eq 0
		__toaster_color_echo $__toaster_color_grey " : "
		__toaster_color_echo $__toaster_color_blue (__toaster_git_branch)
	end
	if test -n "$is_bad"
		set -l asdf (__fish_print_pipestatus '' '' '|' "$(set_color normal)" "$(set_color -o 000000)" $last_pipestatus)
		if test -z "$asdf"
			set asdf (echo -n $last_pipestatus | tr ' ' '|')
			set asdf (printf "$(set_color -o 000000)%s$(set_color normal)" (string join "$(set_color normal)|$(set_color -o 000000)" $last_pipestatus))
		end
		printf " [%s]" "$asdf"
	end
	__toaster_color_echo $__toaster_color_grey " \$ "

	# Fix, output color.
	set_color normal
end
