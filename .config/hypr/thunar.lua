hl.bind("SUPER + E", function() fileManager() end)
local file_manager_workspace = "7"

hl.window_rule({
    match = { class = "thunar" },
    workspace = file_manager_workspace,
})

function fileManager()
    local t = hl.get_window("title:.* - Thunar")
    local w = hl.get_active_window()

    if t == nil then
        local notif = "'Launching Thunar...' 'Get ready to be thrown to Workspace " .. file_manager_workspace .. " when it opens...'"
        hl.dispatch(hl.dsp.exec_cmd("notify-send -i Thunar " .. notif .. " & thunar"))

    -- prevent string.find from reading nil
    elseif w ~= nil then

        -- back to previous workspace if currently focused to thunar
        if string.find(w.title, " - Thunar") then
            hl.dispatch(function() back() end)

        -- used when focused to any other window
        else
            hl.dispatch(hl.dsp.focus({ window = t }))
        end

    -- used when not focused to any window
    else
        hl.dispatch(hl.dsp.focus({ window = t }))
    end
end

-- auto jump to workspace when thunar opens
hl.on("window.open", function(w)
    if string.find(w.title, " - Thunar") then
        hl.dispatch(hl.dsp.focus({ window = w }))
    end
end)
