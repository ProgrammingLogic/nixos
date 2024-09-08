{ config, pkgs, ...}: {
    imports = [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ./nvidia.nix
    ];

    # Bootloader.
    boot.loader.grub.device = "/dev/nvme0n1";
    boot.loader.grub.enable = true;
    boot.loader.grub.useOSProber = true;
    boot.kernel.sysctl."vm.max_map_count" = 2097152; # 16 GB

    networking.hostName = "jls-desktop";

    services = {
        openssh = {
            enable = true;

            settings = {
                PermitRootLogin = "no";
                PasswordAuthentication = false;
            };
        };
    };
}
