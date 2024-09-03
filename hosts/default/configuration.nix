# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports = [ 

    ];

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Chicago";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # NVIDIA CONFIGURATION
    services = {
        xserver = {
            enable = true;
            libinput.enable = true;
        };

        openssh = {
            enable = true;

            settings = {
                PermitRootLogin = "no";
                PasswordAuthentication = false;
            };
        };
        
    };

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.jstiverson = {
        isNormalUser = true;
        description = "Jonathyn Stiverson";
        extraGroups = [ "networkmanager" "wheel" "power" "gamemode"];
        packages = with pkgs; [
          # Security / privacy
          protonvpn-gui
          protonvpn-cli

          # Entertainment
          steam
          spotify
          gamemode 
          gamescope
          lutris
          r2modman

          # Productivity
          obsidian

          # Communication
          discord
          signal-desktop
        ];
    };

    # Install firefox.
    programs.firefox.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        
        configure = {
          customRC = ''
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => INFO
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " Author: Jonathyn Stiverson
            " Created: 08/28/2024
            " Updated: 08/28/2024
            " Notes:
            " - Made heavy use of [amix/vimrc](https://github.com/amix/vimrc/tree/master)

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => GENERAL
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                set history=500

                " Enable filetype plugins
                filetype plugin on
                filetype indent on

                set autoread
                au FocusGained,BufEnter * silent! checktime

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => VIM USER INTERFACE
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Set 7 lines to the cursor - when moving vertically using j/k 
                set so=7

                " Turn on the wild menu
                set wildmenu

                " Ignore compiled files
                set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

                " Always show current position
                set ruler

                " Height of the command bar
                set cmdheight=2

                " Buffer becomes hidden when it is abandoned
                set hid

                " Configure backspace so it acts as it should
                set backspace=eol,start,indent

                " Show line numbers
                set number

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => SEARCHING
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Ignore case while searching
                set ignorecase
                
                " When searching try to be smart about cases
                set smartcase

                " Highlight search results
                set hlsearch

                " Makes search act like search in modern browsers
                set incsearch

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => PERFORMANCE
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Do not redraw when executing macros
                set lazyredraw

                " For regular expressions turn magic on
                set magic


            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => VISUAL
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Show matching brackets when text indicator is over them
                set showmatch
                
                " How many tenths of a second to blink when matching brackets
                set mat=2
                
                " Add extra margin to the left
                set foldcolumn=1

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => SOUNDS
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Disable error sounds
                set noerrorbells
                set novisualbell
                set t_vb=
                set tm=500


            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => COLORS AND FONTS
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Enable syntax highlighting
                syntax enable 
                
                " Set color scheme
                " TODO
                " - Chose my own color theme
                try
                    colorscheme desert
                catch
                endtry

                set background=dark

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => FILES
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Set the file encoding
                set encoding=utf8

                " Use Unix as the standard file type
                set ffs=unix,dos,mac

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => FILES
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Turn off backup since we are using git anyway
                set nobackup
                set nowb
                set noswapfile

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => TEXT, TAB, AND INDENTS
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Use spaces instead of tabs
                set expandtab

                " Be smart when using tabs
                set smarttab

                " 1 tab == 4 spaces
                set shiftwidth=4
                set tabstop=4

                " Linebreak on 500 characters
                set lbr
                set tw=500

                set ai "Auto indent
                set si "Smart indent
                set wrap "Wrap lines

            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => STATUS LINE
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Always show the status line
                set laststatus=2
                
                " Format the status line
                set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
          '';
        };
    };

    programs.bash = {
        enableCompletion = true;
    };

    programs.steam.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # System utilities
        cowsay
        file
        which
        tree
        htop
        iotop
        iftop

        # Archival programs
        zip
        xz
        unzip
        unrar
        p7zip

        # Networking tools
        dnsutils
        dig
        ipcalc

        # Utilities
        neovim
        git
        wget
        curl
    ];

    environment.variables = {
        EDITOR = "nvim";
    };

    # Discord requires this package to install
    nixpkgs.config.permittedInsecurePackage = [
          "electron-25.9.0"
    ]; # nixpkgs.config.permittedInsecurePackage

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        allowed-users = [ "jstiverson" ];
    };
}
