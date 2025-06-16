{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    bat                  # `cat` with wings
    exiftool             # Image metadata tool
    ffmpegthumbnailer
    file
    fzf                  # Fuzzy finder
    ouch                 # Compression and decompression utility
    trash-cli
    unrar
    zstd
  ];

  programs = {
    yazi = {
      enable = true;
      shellWrapperName = "yf";
      plugins  = {
        ouch = pkgs.yaziPlugins.ouch;
        smart-enter = pkgs.yaziPlugins.smart-enter;
      };
      theme = {
        mgr = {
          count_copied   = { fg = "black"; bg = "green"; };
          count_cut      = { fg = "black"; bg = "red"; };
          count_selected = { fg = "black"; bg = "yellow"; };
        };
        tabs = {
          active   = { bg = "blue"; fg = "black"; bold = true; };
          inactive = { fg = "blue"; bg = "black"; };
        };
        mode = {
          normal_main = { bg = "blue"; fg = "black"; bold = true; };
          normal_alt  = { fg = "blue"; bg = "black"; };
          select_main = { bg = "red";  fg = "black"; bold = true; };
          select_alt  = { fg = "red";  bg = "black"; };
          unset_main  = { bg = "red";  fg = "black"; bold = true; };
          unset_alt   = { fg = "red";  bg = "black"; };
        };
        icon = {
          prepend_dirs = [
            { name = "Projects"; text = ""; }
            { name = "Nixcfg"; text = ""; }
          ];
        };
      };
      settings = {
        plugin = {
          prepend_previewers = [
            { mime = "application/{gzip,x-xz,zip,zstd}";  run = "ouch"; }
          ];
        };
        mgr = {
          sort_by = "natural";
          sort_sensitive = false;
          sort_dir_first = true;
          sort_translit = true;
          linemode = "mtime";
          show_hidden = true;
          show_symlink = true;
          scrolloff = 2;
        };
        preview = { wrap = "yes"; };
        opener = {
          play     = [{ desc = "Open with VLC";      run = ''vlc "$@"'';      orphan = true; for = "unix"; }];
          gimp     = [{ desc = "Open with GIMP";     run = ''gimp "$@"'';     orphan = true; }];
          inkscape = [{ desc = "Open with Inkscape"; run = ''inkscape "$@"''; orphan = true; }];
        };
        open = {
          prepend_rules = [
            { mime = "text/*";                            use = ["edit" "reveal"]; }
            { mime = "inode/x-empty";                     use = "edit"; }
            { name = "*.html";                            use = ["open" "edit"]; }
            { mime = "image/*";                           use = ["open" "gimp" "inkscape" "reveal"]; }
            { mime = "application/{gzip,x-xz,zip,zstd}";  use = ["edit" "reveal"]; }
          ];
        };
        confirm = {
          trash = true;
          delete = true;
          overwrite = true;
        };
      };
      keymap = {
        mgr.prepend_keymap = [
          { on = ":"; run = "shell 'nu' --block"; desc = "Launch a shell"; }

          # Smart enter
          { on = "l"; run  = "plugin smart-enter"; desc = "Enter the child directory, or open the file"; }

          # Compress and extract
          { on = ["e" "e"]; run = "shell 'ouch d \"$@\"'"; desc = "Extract archive"; }
          {
            on = ["e" "p"];
            run = "shell 'ouch c -S \"$@\" .tar.zst' --interactive --cursor=15 --orphan";
            desc = "Compress as tar.zst";
          }

          # Backup
          { on = "b"; run = "shell 'cp $0 $0.bak'"; desc = "Create file backup"; }

          # Pager
          { on = "i"; run = "shell 'bat $0' --block"; }

          # Restore trashed files
          {
            on = "u";
            run = ''shell 'file=$(trash-list | grep "$(pwd)" | fzf --preview-window hidden | cut -b21-) \
              && [ -n "$file" ] && yes 0 | trash-restore "$file"' --block'';
            desc = "Restore trashed file";
          }

          # Goto
          { on = ["g" "/"]; run = "cd /";                              desc = "Go to root"; }
          { on = ["g" "b"]; run = "cd ~/notebook";                     desc = "Go ~/notebook"; }
          { on = ["g" "B"]; run = "cd ~/vault";                        desc = "Go ~/vault"; }
          { on = ["g" "c"]; run = "cd ~/.config";                      desc = "Go ~/.config"; }
          { on = ["g" "d"]; run = "cd ~/Downloads";                    desc = "Go ~/Downloads"; }
          { on = ["g" "e"]; run = "cd ~/Documents";                    desc = "Go ~/Documents"; }
          { on = ["g" "f"]; run = "follow";                            desc = "Follow hovered symlink"; }
          { on = ["g" "i"]; run = "cd ~/Pictures";                     desc = "Go ~/Pictures"; }
          { on = ["g" "l"]; run = "cd ~/.dotfiles";                    desc = "Go ~/.dotfiles"; }
          { on = ["g" "m"]; run = "cd ~/Music";                        desc = "Go ~/Music"; }
          { on = ["g" "n"]; run = "cd ~/.dotfiles/nvim/.config/nvim";  desc = "Go to nvim/init.lua"; }
          { on = ["g" "p"]; run = "cd ~/Projects";                     desc = "Go ~/Projects"; }
          { on = ["g" "r"]; run = "cd ~/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f"; desc = "Go to cargo registry"; }
          { on = ["g" "s"]; run = "cd ~/.local/bin";                   desc = "Go to private /bin"; }
          { on = ["g" "v"]; run = "cd ~/Videos";                       desc = "Go ~/Videos"; }
          { on = ["g" "z"]; run = "cd ~/.local/share/nvim/lazy";       desc = "Go to lazydir"; }
        ];
      };
    };
  };
}
