Name = "lakeside-theme-lua"
NamePretty = "Lakeside Theme Selector"
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

    local theme_dir = "/home/Waylake/.local/share/lakeside-theme/themes/"
    local handle = io.popen("find '" ..
        theme_dir ..
        "' -maxdepth 1 -name '*' 2>/dev/null")
    if handle then
        for line in handle:lines() do
            local filename = line:match("([^/]+)$")
            if filename then
                local file = io.open(line .. "/desc.txt", "r")
                if file then
                    local content = file:read("*a")
                    table.insert(entries, {
                        Text = filename,
                        Subtext = content,
                        Value = "echo " .. filename .. " > ~/.local/share/lakeside-theme/current-theme.txt ; " .. line .. "/apply.sh",
                        Icon = line .. "/wallpaper/static.png"
                    })
                    file:close()
                else
                    table.insert(entries, {
                        Text = filename,
                        Subtext = "[no description]",
                        Value = "echo " .. filename .. " > ~/.local/share/lakeside-theme/current-theme.txt ; " .. line .. "/apply.sh",
                        Icon = line .. "/wallpaper/static.png"
                    })
                end
            end
        end
        handle:close()
    end

    return entries
end