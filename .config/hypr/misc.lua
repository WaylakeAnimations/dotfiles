----------------
----- Misc -----
----------------

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = -0.4,

        touchpad = {
            natural_scroll = false,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    debug = {
        disable_logs = true
    }
})