{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    disableConfirmationPrompt = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      tmux-which-key
      nord
    ];
  };
}
