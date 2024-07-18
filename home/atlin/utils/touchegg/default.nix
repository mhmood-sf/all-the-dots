{
  # Enable touchegg.
  services.touchegg.enable = true;

  # Load config
  xdg.configFile."touchegg" = {
    enable = true;
    recursive = true;
    source = ./dots;
  };
}
