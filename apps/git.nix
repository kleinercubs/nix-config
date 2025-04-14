{
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      cm = "commit -m";
      st = "status";
      br = "branch";
    };
    userName = "jiezhuzzz";
    userEmail = "jiezzz@duck.com";
    ignores = [".DS_Store" ".direnv/"];
    delta = {
      enable = true;
    };
  };
}
