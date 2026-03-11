{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      l = "ls -lFh";
      jja = "jj abandon";
      jjb = "jj bookmark";
      jjbc = "jj bookmark create";
      jjbd = "jj bookmark delete";
      jjbf = "jj bookmark forget";
      jjbl = "jj bookmark list";
      jjbm = "jj bookmark move";
      jjbr = "jj bookmark rename";
      jjbs = "jj bookmark set";
      jjbt = "jj bookmark track";
      jjbu = "jj bookmark untrack";
      jjc = "jj commit";
      jjcmsg = "jj commit --message";
      jjd = "jj diff";
      jjdmsg = "jj desc --message";
      jjds = "jj desc";
      jje = "jj edit";
      jjgcl = "jj git clone";
      jjgf = "jj git fetch";
      jjgfa = "jj git fetch --all-remotes";
      jjgp = "jj git push";
      jjgpa = "jj git push --all";
      jjgpd = "jj git push --deleted";
      jjgpt = "jj git push --tracked";
      jjl = "jj log";
      jjla = "jj log -r \"all()\"";
      jjn = "jj new";
      jjnt = "jj new \"trunk()\"";
      jjrb = "jj rebase";
      jjrbm = "jj rebase -d \"trunk()\"";
      jjrs = "jj restore";
      jjsp = "jj split";
      jjsq = "jj squash";
      jjst = "jj status";
    };

    functions = {
      jjrt = ''
        cd "$(jj root || echo .)"
      '';

      jj_prompt_template_raw = ''
        jj --no-pager log --no-graph -r @ -T "$argv" 2> /dev/null
      '';

      jj_prompt_template = ''
        set -l out (jj_prompt_template_raw "$argv")
        or return 1
        string replace --all '%' '%%' "$out"
      '';
    };

    interactiveShellInit = ''
      set -g fish_greeting
      fish_vi_key_bindings
    '';

    loginShellInit =
      if pkgs.stdenv.isDarwin then
        ''
          if test (uname -m) = arm64
            if test -x /opt/homebrew/bin/brew
              eval "$(/opt/homebrew/bin/brew shellenv)"
            end
          end

          fish_add_path --move --prepend "/etc/profiles/per-user/$USER/bin"
          fish_add_path --move --prepend "$HOME/.nix-profile/bin"
        ''
      else
        "";
  };
}
