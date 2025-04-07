{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
    config = {
      global.load_dotenv = true;
      global.warn_timeout = 0;
      whitelist.prefix = ["/home/cc/"];
    };
  };
}
