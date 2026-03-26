Name = "live-wp"
NamePretty = "Live Wallpaper Selector"
HideFromProviderlist = false
Action = "%VALUE%"
HideFromProviderlist = false
SearchName = true
FixedOrder = true
History = false
Cache=false

function GetEntries()
    local entries = {}

    table.insert(entries, {
        Text = "Back",
        Value = "walker --provider menus:lake-personal-menu --hideqa -N",
        Subtext = "Lake's Personal Menu"
    })

    local wp_dir = "/home/Waylake/Wallpapers/"

    local handle = io.popen("find '" ..
        wp_dir ..
        "' -maxdepth 1 -name '*.mp4' 2>/dev/null")
    if handle then
        for line in handle:lines() do
            local filename = line:match("([^/]+)$")
            if filename then
                table.insert(entries, {
                    Text = filename,
                    Value = "pkill mpvpaper ; mpvpaper -p -o 'no-audio loop' '*' " .. line .. " & echo 1 > ~/.local/share/lakeside-theme/mpvpaper-status.txt",
                    -- Preview = line,
                    -- PreviewType = "file",
                    -- Icon = line
                })
            end
        end
        handle:close()
    end

    return entries
end