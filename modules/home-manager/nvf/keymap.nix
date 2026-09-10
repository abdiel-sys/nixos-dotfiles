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
      {
        key = "<C-h>";
        action = "<C-w>h";
        mode = ["n" "t"];
        silent = true;
        desc = "Move to the left window";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
        mode = ["n" "t"];
        silent = true;
        desc = "Move to the right window";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
        mode = ["n" "t"];
        silent = true;
        desc = "Move to the lower window";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
        mode = ["n" "t"];
        silent = true;
        desc = "Move to the upper window";
      }
      {
        key = "<C-t>";
        action = ":vsplit<CR>";
        mode = "n";
        silent = true;
        desc = "Split vertically";
      }
      {
        key = "<Esc>";
        action = "<C-\\><C-n>";
        mode = "t";
        silent = true;
        desc = "Exit terminal mode";
      }
    ];
  };
}
