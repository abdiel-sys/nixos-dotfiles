{
  config,
  pkgs,
  lib,
  ...
}: let
  sessionsDir = "${config.services.displayManager.sessionData.desktops}/share";
in {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  users.users.greeter = {
    isNormalUser = false;
  };

  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        user = "bold";
        command = "uwsm start hyprland-uwsm.desktop";
      };
      default_session = {
        user = "greeter";
        command =
          "${lib.getExe pkgs.tuigreet} "
          + "--time "
          + "--asterisks "
          + "--user-menu "
          + "--sessions ${sessionsDir}/wayland-sessions";
      };
    };
  };
}
