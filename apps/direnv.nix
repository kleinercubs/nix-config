{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    config = {
      global.load_dotenv = true;
      global.warn_timeout = 0;
      global.hide_env_diff = true;
    };
  };
}
