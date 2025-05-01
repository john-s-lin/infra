{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = "$time$directory$python$rust$zig$git_branch$git_commit$git_state$git_status$cmd_duration$character";
      add_newline = false;

      time = {
        format = "[\\[$time\\]](\$style) ";
        style = "cyan";
        disabled = false;
      };

      directory = {
        format = "[\\[$path\\]](\$style) ";
        style = "cyan";
        truncation_symbol = ".../";
        truncate_to_repo = false;
      };

      cmd_duration = {
        min_time = 50;
        show_milliseconds = true;
        style = "yellow";
      };

      python = {
        format = "[\\((\$version)( \$virtualenv)\\)](\$style) ";
        style = "green";
      };

      rust = {
        format = "[\\((\$version)\\)](\$style) ";
        style = "red";
      };

      zig = {
        format = "[\\((\$version)\\)](\$style) ";
        style = "yellow";
      };

      git_branch = {
        format = "[\\[$branch(:\$remote_branch)\\]](\$style) ";
        style = "purple";
      };

      git_status = {
        style = "bold purple";
      };
    };
  };
}
