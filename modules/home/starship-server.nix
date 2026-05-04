{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = "$env_var$username$hostname$directory$git_branch$git_status$custom$cmd_duration$character";
      add_newline = false;

      env_var.SHPOOL_SESSION_NAME = {
        variable = "SHPOOL_SESSION_NAME";
        format = "[\\(shpool-\$value\\)](\$style) ";
        style = "magenta";
      };

      username = {
        style_user = "bold yellow";
        style_root = "bold red";
        format = "[$user]($style)";
      };

      hostname = {
        style = "bold yellow";
        format = "[@$hostname]($style) ";
      };

      directory = {
        format = "➜ [$path]($style) ";
        style = "";
      };

      git_branch = {
        format = "git:([$branch]($style)) ";
        style = "cyan";
      };

      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bold red";
      };

      custom.jj = {
        command = "jj log -r @ -n 1 --color never -T 'change_id.short() + if(bookmarks, \" \" + bookmarks)'";
        when = "jj root";
        shell = ["sh" "-c"];
        format = "jj:([$output]($style)) ";
        style = "cyan";
      };

      cmd_duration = {
        min_time = 50;
        show_milliseconds = true;
        style = "yellow";
      };

      character = {
        success_symbol = "[\\$](bold green)";
        error_symbol = "[\\$](bold red)";
      };
    };
  };
}
