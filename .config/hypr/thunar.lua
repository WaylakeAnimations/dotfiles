hl.bind("SUPER + E", function() fileManager() end)

hl.window_rule({
    match = { class = "thunar", title = ".* - Thunar" },
    workspace = "7",
    float = true,
    size = {"(monitor_w*0.96)", "(monitor_h*0.96)"},
    center = true
})

function fileManager()
    local w = hl.get_window("title:.* - Thunar")

    if w == nil then
        local notif = "'Launching Thunar...' 'Get ready to be thrown to Workspace 7 when it opens...'"
        hl.dispatch(hl.dsp.exec_cmd("notify-send -i Thunar " .. notif .. " & thunar"))
    else
        hl.dispatch(hl.dsp.focus({ window = w }))
    end
end

hl.on("window.open", function(w)
    if string.find(w.title, " - Thunar") ~= nil then
        hl.dispatch(hl.dsp.focus({ window = w }))
    end
end)