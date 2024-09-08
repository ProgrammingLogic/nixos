{ config, pkgs, ...} : {
    home = {
        stateVersion = "23.11";
    };

    imports = [
        ./programs/neovim.nix
    ];

    home.packages = with pkgs; [
        neofetch
    ];
}
