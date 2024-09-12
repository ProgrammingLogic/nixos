{ config, pkgs, ...} : {
    imports = [
        ./gnome/gnome.nix
        ./programs/neovim.nix
    ];

    home = {
        packages = with pkgs; [
            neofetch
        ];
    };
}
