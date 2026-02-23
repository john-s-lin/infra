{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    jujutsu
    ripgrep
    fd
    tree
    jq
    procps
  ];
}
