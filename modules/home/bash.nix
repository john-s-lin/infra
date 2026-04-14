{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    profileExtra = ''
      if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fi
    '';

    initExtra = ''
      # Add Home Manager profile to PATH
      export PATH="$HOME/.nix-profile/bin:$PATH"
    '';
  };
}
