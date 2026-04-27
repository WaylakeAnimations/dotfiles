-----------------
----- Rules -----
-----------------

hl.window_rule({ match = { class = "*" }, immediate = true })

hl.layer_rule({ match = { namespace = "swaync-control-center" },       ignore_alpha = 0, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" },  ignore_alpha = 0, blur = true })
hl.layer_rule({ match = { namespace = "wofi" },                        ignore_alpha = 0, blur = true })
hl.layer_rule({ match = { namespace = "gtk-layer-shell" },             ignore_alpha = 0, blur = true })
hl.layer_rule({ match = { namespace = "walker" },                      ignore_alpha = 0, blur = true })


local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


------------------------------
----- Thunar Extra Rules -----
------------------------------

hl.window_rule({
    name               = "rename",
    match = {
        class          = "thunar",
        initial_title  = "(\bRename\b)[^$]*",
    },
    float              = true,
    size               = "monitor_w/3 monitor_h/6",
    center             = true,
})

hl.window_rule({
    name               = "Attention",
    match = {
        class          = "thunar",
        initial_title  = "Attention",
    },
    center             = true,
})

hl.window_rule({
    name               = "replace",
    match = {
        class          = "thunar",
        initial_title  = "Confirm to replace files",
    },
    center             = true,
})

hl.window_rule({
    name               = "File Operation",
    match = {
        class          = "thunar",
        initial_title  = "File Operation Progress",
    },
    float              = true,
    size               = "monitor_w/3 monitor_h/2.5",
    move               = "(monitor_w-(monitor_w/3))-25 (monitor_h-(monitor_h/2.5))-50",
})

hl.window_rule({
    name               = "errors",
    match = {
        class          = "thunar",
        initial_title  = "",
    },
    center             = true,
})