{
  programs.nvf.settings.vim = {
    # minimap.minimap-vim.enable = true;
    # globals = {
    #   minimap_width = 20;
    #   minimap_auto_start = 1;
    #   minimap_auto_start_win_enter = 1;
    # };
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

    highlight = {
      Normal = {
        bg = "NONE";
      };
      NormalNC = {
        bg = "NONE";
      };
    };
  };
}
