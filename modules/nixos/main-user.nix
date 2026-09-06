{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.mySystem.users.mainUser;
in {
  options = {
    mySystem.users.mainUser = {
      enable = lib.mkEnableOption "Enable main-user";
      userName = lib.mkOption {
        type = lib.types.str;
        default = "bold";
        example = "binl";
        description = "Username of the main user";
      };
      shell = lib.mkOption {
        type = lib.types.package;
        default = pkgs.zsh;
        description = "Shell of the main user";
      };
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [];
        example = lib.literalExpression "[ pkgs.tree pkgs.git ]";
        description = "Packages installed for the main user";
      };
      extraGroups = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = ["wheel" "networkmanager"];
      };
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      extraGroups = cfg.extraGroups;
      shell = cfg.shell;
      packages = cfg.packages;
    };
  };
}
