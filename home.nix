{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "cc";

    homeDirectory = "/home/cc";

    stateVersion = "25.05";

    preferXdgDirectories = true;

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      fastfetch
      bat
      fd
      uv
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      EDITOR = "nvim";
    };

    shellAliases = {
      g = "git";
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ./user.nix # user config
    ./apps/direnv.nix
    ./apps/bash.nix
    ./apps/zsh.nix
    ./apps/oh-my-posh.nix
    ./apps/atuin.nix
    ./apps/tmux.nix
    ./apps/yazi.nix
    ./apps/git.nix
    ./apps/gitui.nix
    ./apps/fzf.nix
    ./apps/nixvim
  ];
}
