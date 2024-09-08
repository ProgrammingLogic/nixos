{ config, pkgs, ...}: {
    imports = [ ];

    programs.gnome-shell = {
        enable = true;
    };

    dconf.settings = {
        # Favorite apps (toolbar on bottom)
        "org/gnome/shell" = {
            favorite-apps = [
                "firefox.desktop",
                "obsidian.desktop",
                "steam.desktop",
                "discord.desktop",
                "spotify.desktop",
                "signal-desktop.desktop",
                "lutris.desktop"
            ];
        };
    };

};
