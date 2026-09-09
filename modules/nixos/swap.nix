{
  boot.kernelParams = ["resume_offset=34816"];
  boot.resumeDevice = "/dev/disk/by-uuid/d811dfe4-8719-43af-92d6-800489f57e0a";
  powerManagement.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024; # 32GB in MB
    }
  ];
}
