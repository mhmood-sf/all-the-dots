{
  # Other programs used/needed when running this WM configuration.
  imports = [
    # Custom gestures.
    ../configs/touchegg
  ];

  config = {
    xdg.configFile."awesome" = {
      enable = true;
      recursive = true;
      source = ./dots;
    };

    # Other packages.
    home.packages = with pkgs; [
      # Enable clipboard
      xclip
    ];
  };
}
