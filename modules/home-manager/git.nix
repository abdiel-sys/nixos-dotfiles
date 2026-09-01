{
  programs.git = {
    enable = true;
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAQkIXeAE1EOjnfwJ0rgF2YetsNcBvErtPq0y//Q+yRB 124847316+abdiel-sys@users.noreply.github.com";
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
    settings."*" = {
      ForwardAgent = false;
      AddKeysToAgent = "yes";
      Compression = false;
      ServerAliveInterval = 0;
      ServerAliveCountMax = 3;
      HashKnownHosts = false;
      UserKnownHostsFile = "~/.ssh/known_hosts";
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
    };
  };
}
