{
    description = "Jonathyn's NixOS Configuration";

    # git repos used in the configuration. nixpkgs, home-manager, stuff like that. 
    inputs = {
        nixpkgs = {
            url = "nixpkgs/nixos-24.05";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    # where the system is configured.
    outputs = { self, nixpkgs, home-manager, ...}: 
        let 
            lib = nixpkgs.lib;
        in {
            nixosModules = {
                declarativeHome = {
                    config = {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPkgs = true;
                    };
                };

                users-jstiverson = ./users/jstiverson;
            };

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

                    modules = with self.nixosModules; [ 
                        # I have no idea what this does
                        ({ config = { nix.registry.nixpkgs.flake = nixpkgs; }; })

                        home-manager.nixosModules.home-manager
                        declarativeHome
                        users-jstiverson

                        ./hosts/default/configuration.nix
                        ./hosts/jls-laptop-dellxps13/configuration.nix

                    ];
                };
            };
        };
}
