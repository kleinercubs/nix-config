{
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      cm = "commit -m";
      st = "status";
      br = "branch";
    };
    ignores = [".DS_Store"];
    delta = {
      enable = true;
    };
  };
}
