{
    description = "Jonathyn's NixOS Configuration";

    # git repos used in the configuration. nixpkgs, home-manager, stuff like that. 
    inputs = {
        nixpkgs = {
            url = "nixpkgs/nixos-24.05";
        };
    };

    # where the system is configured.
    outputs = { self, nixpkgs, ...}: 
        let 
            lib = nixpkgs.lib;
        in {
            nixosConfigurations = {
                jls-desktop = lib.nixosSystem {
                    system = "x86_64-linux";
                    
                    modules = [ 
                        ./hosts/default/configuration.nix 
                        ./hosts/jls-desktop/configuration.nix
                    ];
                };

                jls-laptop-dellxps13 = lib.nixosSystem {
                    system = "x86_64-linux";

                    modules = [
                        ./hosts/default/configuration.nix
                        ./hosts/jls-laptop-dellxps13/configuration.nix
                    ];
                };
            };
        };
}
