{
  programs.git = {
    enable = true;
    signing = {
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };
    settings = {
      user = {
        name = "Abdiel";
        email = "124847316+abdiel-sys@users.noreply.github.com";
      };
      init = {
        defaultBranch = "main";
      };
      gpg = {
        format = "ssh";
      };
    };
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."github.com" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519";
      AddKeysToAgent = "yes";
    };
  };
}
