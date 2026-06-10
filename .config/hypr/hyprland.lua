require("visuals")
require("animations")
require("autostarts")
require("transparency-basic")
require("apps-and-keybinds")
require("monitor-and-env")
require("thunar")
require("rules")
require("misc")

-------------------------------------
----- LSRL rice-specific config -----
-------------------------------------

package.path = os.getenv("HOME") .. "/.lsrl-loaded/.config/hypr/?.lua;" .. package.path
require("hyprland-lr")
