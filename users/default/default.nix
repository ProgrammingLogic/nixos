{ config, pkgs, ...} : {
    imports = [
        ./gnome/gnome.nix
        ./programs/neovim.nix
    ];

    home = {
        stateVersion = "23.11";

        packages = with pkgs; [
            neofetch
        ];
    };
}
