{
  programs.nvf.settings.vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      nix = {
        enable = true;
        lsp.servers = ["nixd"];
      };
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
    treesitter = {
      indent.excludes = ["qml"];
    };
    lsp = {
      enable = true;
      formatOnSave = true;
    };
  };
}
