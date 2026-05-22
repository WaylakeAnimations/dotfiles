----------------------------------------
----- Transparency with DarkWindow -----
----------------------------------------

hl.config({
    plugin = {
        darkwindow = {
            load_shaders = "chromakey"
        },
    }
})

local settings = " targetOpacity=0.85 similarity=0.1 amount=0.1"

local gtk_bkg = " bkg=[0.0745098039 0.0823529411 0.1019607843]"
local gtk_matches = "(thunar|engrampa|nwg-look|org.xfce.mousepad)"

hl.window_rule({ match = { class = gtk_matches },
    ["darkwindow:shade"] = "chromakey" .. gtk_bkg .. settings })

hl.window_rule({ match = { class = "ecode.bin" },
    ["darkwindow:shade"] = "chromakey bkg=[0.1568627450 0.1647058823 0.2117647058]" .. settings })

hl.window_rule({ match = { class = "Audacious" },
    ["darkwindow:shade"] = "chromakey bkg=[0.1882352941 0.1882352941 0.1882352941]" .. settings })

hl.window_rule({ match = { class = "lmms.real" },
    ["darkwindow:shade"] = "chromakey bkg=[0.1294117647 0.1450980392 0.1568627450]" .. settings })

hl.window_rule({ match = { class = "localsend" },
    ["darkwindow:shade"] = "chromakey bkg=[0.0549019607 0.0823529411 0.0745098039]" .. settings })

hl.window_rule({ match = { class = "waterfox" },
    ["darkwindow:shade"] = "chromakey bkg=[0.1686274509 0.1647058823 0.2000000000]" .. settings })
