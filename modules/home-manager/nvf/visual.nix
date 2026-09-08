{
  programs.nvf.settings.vim = {
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
