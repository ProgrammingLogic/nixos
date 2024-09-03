{ config, pkgs, ...}: {
    imports = [

    ];

    networking.hostName = "jls-desktop";

    hardware.opengl = {
        enable = true;
    };

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services = {
        xserver = {
            videoDrivers = [ "nvidia" ];
        };

        openssh = {
            enable = true;

            settings = {
                PermitRootLogin = "no";
                PasswordAuthentication = false;
            };
        };
    };
}
