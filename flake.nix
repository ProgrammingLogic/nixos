{
    description = "Jonathyn's NixOS Configuration";

    # git repos used in the configuration. nixpkgs, home-manager, stuff like that. 
    inputs = {
        nixpkgs = {
            url = "nixpkgs/nixos-24.05";
        };

        home-manager = {
            url = "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
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
            };

            nixosConfigurations = {
                jls-desktop = lib.nixosSystem {
                    system = "x86_64-linux";
                    
                    modules = [ 
                        ./hosts/default/configuration.nix 
                        ./hosts/jls-desktop/configuration.nix

                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            
                            home-manager.users.jstiverson = {
                                imports = [
                                    ./users/default/default.nix
                                    # ./users/jstiverson/jstiverson.nix
                                ];
                            };
                        }
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
