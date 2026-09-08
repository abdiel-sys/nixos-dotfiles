{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
        viAlias = true;
        vimAlias = true;
        searchCase = "smart";
        options = {
          conceallevel = 1;
          shiftwidth = 2;
        };
      };
    };
  };
}
