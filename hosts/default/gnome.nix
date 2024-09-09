{ config, pkgs, ... }: {
    # Gnome / related applications to install
    environment.systemPackages = (with pkgs; [

    ]) ++ (with pkgs.gnome; [
        # Applications with gnome. as prefix 
        gpaste
        gnome-tweaks
        gnome-terminal

    ]) ++ (pkgs.gnomeExtensions; [
        # Gnome extensions

    ]);

    # Gnome / related applications to exclude from install
    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
    ]) ++ (with pkgs.gnome; [
        cheese
        gedit
        epiphany
        geary
        tali
        iagno
        hitori
        atomix
        simple-scan
        gnome-contacts
        gnome-music
        gnome-weather
        gnome-clocks
        gnome-maps
        gnome-calendar
        gnome-videos
    ]);
};
