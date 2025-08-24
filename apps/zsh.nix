{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    antidote.enable = true;
    
    initContent = ''
    # >>> conda initialize >>>
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
    
    # Oh My Zsh configuration
    export ZSH="/zp_$(hostname)/scratch_lb/weichen/.nix-profile/share/oh-my-zsh"
    ZSH_THEME="robbyrussell"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
    '';
    
    antidote.plugins = [
      "zsh-users/zsh-completions"
      "zsh-users/zsh-syntax-highlighting"
      "zsh-users/zsh-history-substring-search"
      "jeffreytse/zsh-vi-mode"
      "Aloxaf/fzf-tab"
      "lipov3cz3k/zsh-uv"
    ];
  };
}
