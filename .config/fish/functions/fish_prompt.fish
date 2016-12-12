set __toaster_color_yellow E6DB7E
set __toaster_color_pink F92672
set __toaster_color_grey 554F48
set __toaster_color_white AAAAAA

function __toaster_color_echo
	set_color $argv[1]
	echo -n $argv[2]
end

function __toaster_current_folder
	# echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g'
	echo -n $PWD
end

function fish_prompt
	# Lazy cat if last command had non-zero return value.
	# Otherwise curious fat cat.
	if test $status -ne 0
		__toaster_color_echo $__toaster_color_yellow "(^-.-^)ﾉ"
	else
		__toaster_color_echo $__toaster_color_yellow "(^._.^)ﾉ"
	end

	__toaster_color_echo $__toaster_color_grey " @ "
	__toaster_color_echo $__toaster_color_pink (__toaster_current_folder)
	__toaster_color_echo $__toaster_color_grey " \$ "

	# Fix, output color.
	set_color $__toaster_color_white
end