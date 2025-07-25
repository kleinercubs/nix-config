{
  pkgs,
  lib,
  ...
}: {
  programs.git =
    {
      enable = true;
      aliases = {
        co = "checkout";
        cm = "commit -m";
        csm = "commit -s -m"; # DCO
        st = "status";
        br = "branch";
      };
      userName = "kleinercubs";
      userEmail = "weichxli@gmail.com";
      ignores = [".DS_Store" ".direnv/"];
      delta = {
        enable = true;
      };
    }
    // lib.optionalAttrs pkgs.stdenv.isDarwin {
      extraConfig = {
        gpg.format = "ssh";
        "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        commit.gpgSign = true;
        user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPqAEvgo0iyCrzXC2i03sTHQIAgSbzwPp9U44fIOGXMu";
      };
    };
}
