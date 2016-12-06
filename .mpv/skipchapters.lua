require 'mp.options'
local opt = {
    patterns = {
        "^OP$","^[Oo]pening$","^[Oo]pening.*$",
        "^ED$","^[Ee]nding$","^[Ee]nding.*$","^[Cc]losing.*$","^End.*$",
        "^[Pp]review$", ".*[Pp]review.*$",
    },
}
read_options(opt)

function check_chapter(_, chapter)
    local chapters = mp.get_property_native("chapter-list")
    print("Chapter names:")
    for i = 1, #chapters do
        print(chapters[i].title)
    end
 
    if not chapter then
        return
    end
    for _, p in pairs(opt.patterns) do
        if string.match(chapter, p) then
            print("Skipping chapter:", chapter)
            os.execute("sleep 1")
            mp.command("no-osd add chapter 1")
            return
        end
    end
end

print(mp.get_script_name())
mp.observe_property("chapter-metadata/by-key/title", "string", check_chapter)
