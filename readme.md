![desktop-hyprarchive](https://raw.githubusercontent.com/WaylakeAnimations/dotfiles/refs/heads/main/rice-screenshots/desktop-hyprarchive.png)
## Waylake's Dotfiles
umm... hi there, welcome to my dotfiles repo :3...

Some of these configs are written with Hyprland in mind...

Note: Screenshots are taken with HyprArchive applied, which exist in a separate repo...

### About the sudoers
You'll need to make sure the mode and owner are set up correctly before putting those in
```
su
cp -r ./etc/sudoers.d /etc
visudo -O -P /etc/sudoers.d/10-timestamp_timeout
visudo -O -P /etc/sudoers.d/10-passwd_timeout
exit
```

## More Screenshots
![term](https://raw.githubusercontent.com/WaylakeAnimations/dotfiles/refs/heads/main/rice-screenshots/term.png)

todo: add more
