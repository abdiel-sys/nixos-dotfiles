{lib, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
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
        searchCase = "smart";
        options = {
          conceallevel = 1;
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
          lua.enable = true;
          markdown = {
            enable = true;
            format.enable = false;
            extensions.render-markdown-nvim = {
              enable = true;
            };
          };
        };
        highlight = {
          Normal = {
            bg = "NONE";
          };
          NormalNC = {
            bg = "NONE";
          };
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
        notes = {
          obsidian = {
            enable = true;
            setupOpts = {
              workspaces = [
                {
                  name = "notebook";
                  path = "~/sync/notebook";
                }
              ];
              templates = {
                folder = "templates";
                date_format = "%Y-%m-%d-%a";
                time_format = "%H:%M";
              };
              legacy_commands = false;
              note_id_func = lib.generators.mkLuaInline ''
                function(title)
                  local suffix = ""

                  if title ~= nil then
                    suffix = title
                      :gsub(" ", "-")
                      :gsub("[^A-Za-z0-9-]", "")
                      :lower()
                  else
                    for _ = 1, 4 do
                      suffix = suffix .. string.char(math.random(65, 90))
                    end
                  end

                  return tostring(os.time()) .. "-" .. suffix
                end
              '';
              ui = {
                enable = false;
              };
            };
          };
        };
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
          {
            key = "<leader>gd";
            action = ":lua vim.lsp.buf.definition()<CR>";
            mode = "n";
            silent = true;
            desc = "go to declaration";
          }
          {
            key = "<leader>ns";
            action = ":Obsidian search<CR>";
            mode = "n";
            silent = true;
            desc = "Search notes";
          }
        ];
        luaConfigPost = ''
          local show_dotfiles = true

          local filter_show = function(fs_entry)
            return true
          end

          local filter_hide = function(fs_entry)
            return not vim.startswith(fs_entry.name, ".")
          end

          local toggle_dotfiles = function()
            show_dotfiles = not show_dotfiles

            local new_filter = show_dotfiles
              and filter_show
              or filter_hide

            MiniFiles.refresh({
              content = {
                filter = new_filter,
              },
            })
          end

          vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
              vim.keymap.set(
                "n",
                "g.",
                toggle_dotfiles,
                { buffer = args.data.buf_id }
              )
            end,
          })
        '';
      };
    };
  };
}
