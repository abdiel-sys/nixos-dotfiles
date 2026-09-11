{
  programs.nvf.settings.vim = {
    tabline.nvimBufferline = {
      enable = true;
      mappings = {
        closeCurrent = "<leader>bx";
        cycleNext = "<leader>]";
        cyclePrevious = "<leader>[";
      };
      setupOpts = {
        # options = {
        #   separator_style = "padded_slant";
        # };

        highlights = {
          fill = {
            bg = "NONE";
          };
          buffer_selected = {
            bold = true;
          };
        };
      };
    };
  };
}
