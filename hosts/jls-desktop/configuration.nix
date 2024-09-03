{ config, pkgs, ...}: {
    imports = [
        # Include the results of the hardware scan.
        ./hardware_configuration.nix
    ];

    # Bootloader.
    boot.loader.grub.device = "/dev/nvme0n1";
    boot.loader.grub.enable = true;
    boot.loader.grub.useOSProber = true;

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
