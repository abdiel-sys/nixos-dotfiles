{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  boot.extraModprobeConfig = ''
    options nvidia NVreg_EnableGpuFirmware=0
  '';

  boot.blacklistedKernelModules = [
    "nouveau"
    "rivafb"
    "nvidiafb"
    "rivatv"
    "nv"
    "uvcvideo"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
}
