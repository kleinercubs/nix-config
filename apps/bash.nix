{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      source ${pkgs.uv}/share/bash-completion/completions/uv.bash
    '';
  };
}
