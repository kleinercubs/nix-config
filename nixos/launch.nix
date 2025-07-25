{pkgs, ...}: {
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0;
    limine.maxGenerations = 5;
  };
  boot.kernelParams = ["quiet"];
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # boot.kernel.sysctl = {
  #   "kernel.split_lock_mitigate" = 0;
  #   "kernel.nmi_watchdog" = 0;
  #   "kernel.sched_bore" = "1";
  # };
  boot.initrd.systemd.enable = true;
  boot.initrd.verbose = false;
  boot.plymouth.enable = true;
  boot.consoleLogLevel = 0;
  # systemd.extraConfig = "DefaultTimeoutStopSec=5s";

  services.getty.autologinUser = "weichen";
  services.greetd = {
    enable = true;
    settings.default_session = {
      user = "weichen";
      command = "steam-gamescope > /dev/null 2>&1";
    };
  };
}
