{pkgs, ...}: {
  home.stateVersion = "25.11";

  home.preferXdgDirectories = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    fastfetch
    bat
    fd
    uv
    lazydocker
    podman-tui
    bottom
    jaq
    ripgrep
    procs
    alejandra
    codex
    curlie
    scc
    docker
    oh-my-zsh
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
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

  home.sessionVariables = {
    EDITOR = "nvim";
    ZVM_INIT_MODE = "sourcing";
  };

  home.shellAliases = {
    g = "git";
    vim = "nvim";
    vi = "nvim";
    ls = "eza";
    ll = "eza -l";
    la = "eza -la";
    tree = "eza --tree";
    lzd = "lazydocker";
    jq = "jaq";
    grep = "rg";
    # ssh = "TERM=xterm-256color ssh";
    openstack = "uvx --from python-openstackclient openstack";
    blazar = "uvx --from python-blazarclient blazar";
  };

  programs.home-manager.enable = true;

  imports = [
    ../apps/direnv.nix
    ../apps/eza.nix
    ../apps/zsh.nix
    ../apps/oh-my-posh.nix
    ../apps/tmux.nix
    ../apps/yazi.nix
    ../apps/git.nix
    ../apps/gitui.nix
    ../apps/fzf.nix
    ../apps/helix.nix
    ../apps/nixvim
    ../apps/docker.nix
  ];
}
