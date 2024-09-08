{ config, pkgs, ...}: {
    imports = [ ];
    
    hardware.opengl = {
        enable = true;
    };

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    services.xserver = {
        videoDrivers = [ "nvidia" ];
    };
}
