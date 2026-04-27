------------------------
----- Set programs -----
------------------------

local terminal     = "kitty"
local fileManager  = "thunar"
local lockscreen   = "hyprlock -c ~/.config/hypr/hyprlock.conf"

local menu   = "walker --provider desktopapplications --hideqa --theme hyarc-app"
local pmenu  = "walker --provider menus:lake-personal-menu --hideqa -N --theme hyarc-menu"

local shutdown_menu = "walker --provider menus:power-menu --hideqa -N -n --minheight 210 --maxheight 210 --minwidth 160 --maxwidth 160"


--------------------
----- Keybinds -----
--------------------

local mainMod = "SUPER"
mainModG = "SUPER"

-- Launcher and Apps --
hl.bind(mainMod .. " + R",      hl.dsp.exec_cmd(pmenu))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))

-- Windowing --
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",             hl.dsp.window.fullscreen({ action = "toggle" }))

-- Misc --
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(shutdown_menu))

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("grimshot --cursor --notify save screen $(date +$(echo ~)/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png)"))
-- "the minute spot used to be taken by month number, but i fixed it now" - wl, 2026

-- Move window --
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Focus to different window --
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })