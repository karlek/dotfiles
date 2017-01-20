-- requires subliminal, version 1.0 or newer
-- default keybinding: b
-- add the following to your input.conf to change the default keybinding:
-- keyname script_binding auto_load_subs
local utils = require 'mp.utils'
function title_fn()
    mp.osd_message(mp.get_property("path"))
end

mp.add_key_binding("N", "print_title", title_fn)
