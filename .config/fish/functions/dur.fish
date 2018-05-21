# Find shortest movie in folder
function dur_backend
    if not count $argv > /dev/null
        set -x movies (find . -iname '*.mp4' -o -iname '*.mkv' -o -iname '*.avi' -o -iname '*.mov' -o -iname '*.webm')
    else
        set -x movies $argv
    end

    for f in $movies
        ffprobe $f 2> /dev/null
        if test $status -eq 1
            continue
        end

        set -x duration (ffprobe $f 2>&1 | grep Duration | cut -c 13- | cut -c -11 | rev | cut -c 4- | rev)
        set -l filename (basename $f | string sub --length 64)
        if test (string length $filename) -gt 60
                set filename "$filename..."
        end
        printf "%s\t%s\n" $filename $duration;
    end
end

# Pretty print dur.
alias dur='dur_backend | expand -t 69,$COLUMNS'

function durshort
    dur_backend $argv | awk -F '\t' '{print $2 "\t" $1}' | sort -n | awk -F '\t' '{print $2 "\t" $1}' | expand -t 69,$COLUMNS
end
