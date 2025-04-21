{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    antidote.enable = true;
    antidote.plugins = [
      "zsh-users/zsh-completions"
      "zsh-users/zsh-syntax-highlighting"
    ];    
    oh-my-zsh = {
      enable = true;
      theme = "agnoster"; # You can choose any theme you prefer
    };
    initExtra = ''# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/zp_$(hostname)/scratch_sb/weichenli/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/zp_$(hostname)/scratch_sb/weichenli/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/zp_$(hostname)/scratch_sb/weichenli/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/zp_$(hostname)/scratch_sb/weichenli/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
      export PATH="$HOME/.nix-profile/bin:/zp_goku/scratch_sb/weichenli/miniconda3/bin:$PATH"
    '';
    shellAliases = {
      sl = "exa";
      ls = "exa";
      l = "exa -l";
      la = "exa -la";
      ip = "ip --color=auto";
    };
  };
}
