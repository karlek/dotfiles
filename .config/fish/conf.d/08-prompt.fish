set __toaster_color_yellow E6DB7E
set __toaster_color_pink F92672
set __toaster_color_grey 554F48
set __toaster_color_white AAAAAA
set __toaster_color_blue 9999FF
set __toaster_color_green 99FF99

function __toaster_color_echo
	set_color $argv[1]
	echo -n $argv[2]
end

function __toaster_current_folder
	echo -n $PWD
end

function is_git_folder
	git rev-parse --abbrev-ref HEAD ^ /dev/null > /dev/null
	if test $status -ne 0
		echo 1
		return
	end
	echo 0
end

function __toaster_git_branch
	printf "(%s)" (git rev-parse --abbrev-ref HEAD ^ /dev/null)
end

function fish_prompt
	# Lazy cat if last command had non-zero return value.
	# Otherwise curious fat cat.
	if test $status -ne 0
		__toaster_color_echo $__toaster_color_yellow "(^-.-^)ノ"
	else
		__toaster_color_echo $__toaster_color_yellow "(^._.^)ノ"
	end

	__toaster_color_echo $__toaster_color_blue " "(hostname)
	__toaster_color_echo $__toaster_color_grey " @ "
	__toaster_color_echo $__toaster_color_pink (__toaster_current_folder)
	if test (is_git_folder) -eq 0
		__toaster_color_echo $__toaster_color_grey " : "
		__toaster_color_echo $__toaster_color_green (__toaster_git_branch)
	end
	__toaster_color_echo $__toaster_color_grey " \$ "

	# Fix, output color.
	set_color $__toaster_color_white
end
