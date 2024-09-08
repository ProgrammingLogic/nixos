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

        # Multitasking
            "org/gnome/nutter" = {
                edge-tiling = true;
            };

        # Appearance 
            # Dark mode
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
            };

            # Background 
            "org/gnome/desktop/screensaver" = {
                picture-uri = "file:///home/jstiverson/.local/share/backgrounds/orthodox_background.jpg";
            picture-uri-dark = "file:///home/jstiverson/.local/share/backgrounds/orthodox_background.jpg"
            };

            "org/gnome/desktop/background" = {
                picture-options = "scaled";
            };
    };

    # Set the computer background
    home.file.".local/share/background/orthodox_background.jpg" = {
        source = "../../../resources/orthodox_background.jpg";
    };
}
