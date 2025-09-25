{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable Docker service
  services.docker.enable = true;
  virtualisation.docker.enable = true;
  # Add weichen user with docker group
  users.users.weichenli = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # 'docker' group is required to run docker without sudo
  };
} 