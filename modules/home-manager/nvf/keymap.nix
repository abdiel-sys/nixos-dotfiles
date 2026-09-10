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
      # Tabs keymaps
      # Moving through windows
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
      # Split windows
      {
        key = "<C-t>";
        action = ":vsplit<CR>";
        mode = "n";
        silent = true;
        desc = "Split vertically";
      }
      # Resize windows
      {
        key = "<C-,>";
        action = "<C-w><";
        mode = "n";
        silent = true;
        desc = "Resize width";
      }
      {
        key = "<C-.>";
        action = "<C-w>>";
        mode = "n";
        silent = true;
        desc = "Resize width +";
      }
      # Terminal
      {
        key = "<Esc>";
        action = "<C-\\><C-n>";
        mode = "t";
        silent = true;
        desc = "Exit terminal mode";
      }
      # Bufferline
      {
        key = "<leader>tn";
        action = ":vert belowright sbnext<CR>";
        mode = "n";
        silent = true;
        desc = "Split vertically along the next buffer to the right";
      }
      {
        key = "<leader>ts";
        action = ":horizontal sbnext<CR>";
        mode = "n";
        silent = true;
        desc = "Split horizontally along the next buffer to the right";
      }
    ];
  };
}
