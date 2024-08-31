{
    description = "Desktop configuration";

    # git repos used in the configuration. nixpkgs, home-manager, stuff like that. 
    inputs = {
        nixpkgs = {
            url = "github.com/nixos/nixpkgs/nixos-24.05";
        };
    };

    # where the system is configured.
    outputs = { self, nixpkgs, ...}: 
        let 
            lib = nixpkgs.lib;
        in {
            nixosConfigurations = {
                jls_desktop = lib.nixosSystem {
                    system = "x86_64-linux";
                    modules = [ ./configuration.nix ];
                };
            };
        };
}
