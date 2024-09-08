{ config, pkgs, ...}: {
    imports = [ ];

    programs.gnome-shell = {
        enable = true;
    };

    dconf.settings = {
        # Favorite apps (toolbar on bottom)
            "org/gnome/shell" = {
                favorite-apps = [
                    "firefox.desktop"
                    "obsidian.desktop"
                    "steam.desktop"
                    "discord.desktop"
                    "spotify.desktop"
                    "signal-desktop.desktop"
                    "lutris.desktop"
                ];
            };

        # Power Settings
            # Do not turn the screen blank after X time
            "org/gnome/desktop/session" = {
                idle-delay = 0;
            };

            "org/gnome/settings-daemon/plugins/power" = {
                # Turn off auto suspend
                sleep-inactive-ac-type = "nothing";

                # Shutdown system when power button is pressed
                power-button-action = "interactive";
            };
    };
}
