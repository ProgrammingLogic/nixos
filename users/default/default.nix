{ lib, pkgs, osConfig, ... }: {
    home.packages = with pkgs; [
        minecraft
    ];
}
