{ config, pkgs, ... }: {
    # Gnome / related applications to install
    environment.systemPackages = (with pkgs; [

    ]) ++ (with pkgs.gnome; [
        # Applications with gnome. as prefix 
        gpaste
        gnome-tweaks
        gnome-terminal

    ]) ++ (with pkgs.gnomeExtensions; [
        # Gnome extensions

    ]);

    # Gnome / related applications to exclude from install
    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
        gedit
    ]) ++ (with pkgs.gnome; [
        cheese
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
}
