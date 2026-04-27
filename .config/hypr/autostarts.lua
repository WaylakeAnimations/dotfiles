----------------------
----- Autostarts -----
----------------------

hl.on("hyprland.start", function () 
  -- hl.exec_cmd("hyprctl plugin load ~/Hypr-DarkWindow/out/hypr-darkwindow.so")
  hl.exec_cmd("bash ~/.local/share/lakeside-rice-loader/lsrl.sh -r")

  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("xhost +SI:localuser:root")

  hl.exec_cmd("/usr/bin/blueman-applet")
  hl.exec_cmd("swaync -c ~/.config/swaync/config.json -s ~/.config/swaync/style.css")
  hl.exec_cmd("nm-applet")

  hl.exec_cmd("gammastep -O 4500K")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")

  hl.exec_cmd("walker --gapplication-service")
  hl.exec_cmd("systemctl --user start elephant")
end)