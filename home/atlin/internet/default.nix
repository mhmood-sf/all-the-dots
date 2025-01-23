{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./thunderbird
  ];

  home.packages = with pkgs; [
    # RSS reader.
    newsflash
    # IRC client.
    polari
  ];
}
