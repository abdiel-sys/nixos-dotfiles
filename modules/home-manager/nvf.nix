{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        spellcheck = {
          enable = true;
          programmingWordlist.enable = true;
          languages = [
            "en"
            "es"
          ];
        };
        viAlias = true;
        vimAlias = true;
        options = {
          shiftwidth = 2;
        };
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        languages = {
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
          qml.enable = true;
        };
        visuals = {
          nvim-web-devicons.enable = true;
          cellular-automaton.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;

          indent-blankline = {
            enable = true;
          };

          nvim-cursorline = {
            enable = true;
            setupOpts = {
              lineTimeout = 0;
            };
          };
        };
        statusline = {
          lualine = {
            enable = true;
          };
        };
        treesitter = {
          indent.excludes = [
            "qml"
          ];
        };
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };
        mini.files = {
          enable = true;
          setupOpts = {
            mappings = {
              go_out = "<BS>";
              go_in = "<CR>";
            };
            windows.preview = true;
          };
        };

        telescope.enable = true;
        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
          setupOpts = {
            signature.enabled = true;
            cmdline = {
              keymap.preset = "cmdline";
              completion.menu.auto_show = true;
            };
          };
        };

        keymaps = [
          {
            key = "<leader>e";
            action = ":lua MiniFiles.open()<CR>";
            mode = "n";
            silent = true;
            desc = "enable MiniFiles";
          }
        ];
      };
    };
  };
}
