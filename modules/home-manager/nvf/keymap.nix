{
  programs.nvf.settings.vim = {
    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
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
  };
}
