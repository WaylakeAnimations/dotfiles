require("visuals")
require("animations")
require("autostarts")
require("apps-and-keybinds")
require("monitor-and-env")
require("misc")

-------------------------------------
----- LSRL rice-specific config -----
-------------------------------------

package.path = os.getenv("HOME") .. "/.lsrl-loaded/.config/hypr/?.lua;" .. package.path
require("hyprland-lr")
