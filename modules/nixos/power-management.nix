{
  services.power-profiles-daemon.enable = true;
  services.logind.settings.Login = {
    LidSwitch = "suspend-then-hibernate";
    PowerKey = "hibernate";
    PowerKeyLongPress = "poweroff";
  };
  boot.kernelParams = ["mem_sleep_default=deep"];

  # Define time delay for hibernation
  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "30m";
    SuspendState = "mem";
  };
}
