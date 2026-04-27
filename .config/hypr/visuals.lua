-------------------
----- Visuals -----
-------------------

hl.env("HYPRCURSOR_THEME", "Urawa Hanako (3D)")
hl.env("HYPRCURSOR_SIZE", "24")

local accent = "rgb(3498db)"
local urgent = "rgb(f0544c)"
local inactive = "rgb(222222)"

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 15,

        border_size = 2,

        col = {
            active_border   = accent,
            inactive_border = inactive,
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
        },

        blur = {
            enabled   = true,
            size      = 5,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },

    animations = {
        enabled = true,
    },
})