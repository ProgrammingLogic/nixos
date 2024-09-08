{ config, pkgs, ... }: {
    imports = [ ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraConfig = ''
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " => INFO
            """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " Author: Jonathyn Stiverson
            " Created: 08/28/2024
            " Updated: 09/3/2024
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
}
