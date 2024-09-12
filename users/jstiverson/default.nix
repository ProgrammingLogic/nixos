{ config, pkgs, ...} : {
    config = {
        home-manager.users.jstiverson = ./home.nix;
        users.users.jstiverson = {
            isNormalUser = true;
            description = "Jonathyn Stiverson";
            extraGroups = [ "networkmanager" "wheel" "power" "gamemode"];
            packages = with pkgs; [
              # Security / privacy
              protonvpn-gui
              protonvpn-cli

              # Entertainment
              steam
              spotify
              gamemode 
              gamescope
              lutris
              r2modman

              # Productivity
              obsidian

              # Communication
              vesktop
              signal-desktop
            ];
        };
    };
}
