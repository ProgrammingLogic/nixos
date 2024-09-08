{ config, pkgs, ...} : {
    home = {
        stateVersion = "23.11";
    };

    imports = [
        ./gnome/gnome.nix
        ./programs/neovim.nix
    ];

    home.packages = with pkgs; [
        neofetch
    ];
}
