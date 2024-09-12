{ config, pkgs, ...} : {
    config = {
        home-manager.users.jstiverson = ./home.nix;
        users.users.jstiverson = {

        };
    };
}
