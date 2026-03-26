Name = "st-wp"
NamePretty = "Wallpaper Selector"
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

    table.insert(entries, {
        Text = "Theme Dependent",
        Value = "pkill mpvpaper ; echo 0 > ~/.local/share/lakeside-theme/mpvpaper-status.txt ; hyprctl hyprpaper wallpaper ' , ~/.local/share/lakeside-theme/current-wallpapers/static.png, fill'",
        Subtext = "Follow current theme",
        Icon = "/home/Waylake/.local/share/lakeside-theme/current-wallpapers/static.png"
    })

    local wp_dir = "/home/Waylake/Wallpapers/"
    local handle = io.popen("find '" ..
        wp_dir ..
        "' -maxdepth 1 -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.bmp' -o -name '*.webp' 2>/dev/null")
    if handle then
        for line in handle:lines() do
            local filename = line:match("([^/]+)$")
            if filename then
                table.insert(entries, {
                    Text = filename,
                    Value = "pkill mpvpaper ; echo 0 > ~/.local/share/lakeside-theme/mpvpaper-status.txt ; hyprctl hyprpaper wallpaper ' , " .. line .. ", fill'",
                    -- Preview = line,
                    -- PreviewType = "file",
                    Icon = line
                })
            end
        end
        handle:close()
    end
    return entries
end