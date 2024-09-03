{ config, pkgs, ... }:

{
    imports = [
        # Include the results of the hardware scan.
        ./hardware_configuration.nix
    ];

    networking.hostName = "jls-laptop-dellxps13"; # Define your hostname.
};
