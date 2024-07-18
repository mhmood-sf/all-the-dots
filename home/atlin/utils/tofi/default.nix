{ pkgs, colors, ... }:
{
  xdg.configFile."tofi/config" = {
    enable = true;
    text = ''
      font = "Google Sans Medium"
      font-size = 12
      text-color = ${colors.bg-primary}

      # Window background color
      background-color = ${colors.fg-primary}

      # Prompt to display.
      prompt-text = "› "

      # Input text theme
      input-color = ${colors.bg-primary}

      # Selection text
      selection-color = ${colors.accent-primary}

      # Matching portion of selection text
      selection-match-color = ${colors.accent-primary}

      # Width and height of the window. Can be pixels or a percentage.
      width = 300
      height = 200

      # Width of the border in pixels.
      border-width = 0

      # Border outline width
      outline-width = 0

      # Radius of window corners in pixels.
      corner-radius = 7

      # Padding between borders and text. Can be pixels or a percentage.
      padding-top = 10
      padding-bottom = 10
      padding-left = 10
      padding-right = 10

      # Whether to scale the window by the output's scale factor.
      scale = true

      # Location on screen to anchor the window to.
      #
      # Supported values: top-left, top, top-right, right, bottom-right,
      # bottom, bottom-left, left, center.
      anchor = center

      # Window offset from edge of screen. Only has an effect when anchored
      # to the relevant edge. Can be pixels or a percentage.
      margin-top = 30
      margin-bottom = 30
      margin-left = 30
      margin-right = 30

      # Show a text cursor in the input field.
      text-cursor = true
      text-cursor-style = block
    '';
  };

  home.packages = with pkgs; [
    tofi
  ];
}
