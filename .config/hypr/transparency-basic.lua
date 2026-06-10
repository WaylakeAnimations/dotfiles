-----------------------------------------
----- Basic Transparency Multiplier -----
-----------------------------------------

local opacity = "0.85"
local basic_transparency_matches =
"(engrampa|nwg-look|org.xfce.mousepad|ecode.bin|Audacious|localsend|" .. 
"waterfox|lmms.real|obsidian|thunar)"

hl.window_rule({ match = { class = basic_transparency_matches }, opacity = opacity })
