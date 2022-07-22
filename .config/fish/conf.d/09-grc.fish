#!/usr/bin/env fish
#
# To load in ~/.config/fish/fish.conf or a new file in
# ~/.config/fish/conf.d add:
# source /etc/grc.fish (path may depend on install method)
#
# See also the plugin at https://github.com/oh-my-fish/plugin-grc

function is_alias --argument-names aliases executable
	for alias in (string split " " "$aliases")
		if test $alias = $executable
			echo 1
			return
		end
	end
	echo 0
end

set -U grc_plugin_execs cat cvs df diff dig gcc g++ ls ifconfig \
       make mount mtr netstat ping ps tail traceroute \
       wdiff blkid du dnf docker docker-compose docker-machine env id ip iostat journalctl kubectl \
       last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap \
       fdisk findmnt free semanage sar ss sysctl systemctl stat showmount \
       tcpdump tune2fs vmstat w who sockstat

set -l aliases (alias | awk '{print $2}')
for executable in $grc_plugin_execs
    if type -q $executable
		if test (is_alias "$aliases" $executable) = 1
			continue
		end
        function $executable --inherit-variable executable --wraps=$executable
            if isatty 1
                grc $executable $argv
            else
                eval command $executable $argv
            end
        end
    end
end
