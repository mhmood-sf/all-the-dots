{ pkgs, colors, ... }:
let
  # '#RRGGBB' -> 'RRGGBBFF'
  getColor = clr: (builtins.substring 1 (builtins.stringLength clr) clr) + "FF";
in {
  config = {
    xdg.configFile."yambar/config.yml" = {
      enable = true;
      text = ''
      # Fonts we'll be re-using here and there
      awesome: &awesome Font Awesome 6 Free:style=solid:pixelsize=12

      # Default background for active river tags
      bg_default: &bg_default {stack: [{background: {color: ${getColor colors.bg-secondary}}}, {underline: {size: 4, color: ${getColor colors.accent-primary}}}]}

      bar:
        height: 30
        location: top
        spacing: 7
        margin: 10

        # Default font
        font: Google Sans:pixelsize=15:weight=120

        foreground: ${getColor colors.fg-primary}
        background: ${getColor colors.bg-secondary}

        left:
          - river:
              anchors:
                - base: &river_base
                    left-margin: 10
                    right-margin: 13
                    default: {string: {text: X, font: *awesome}}
                    conditions:
                      id == 1: {string: {text: 1}}
                      id == 2: {string: {text: 2}}
                      id == 3: {string: {text: 3}}
                      id == 4: {string: {text: 4}}
                      id == 5: {string: {text: 5}}
                      id == 6: {string: {text: 6}}
                      id == 7: {string: {text: 7}}
                      id == 8: {string: {text: 8}}
                      id == 9: {string: {text: 9}}
              content:
                map:
                  conditions:
                    state == urgent:
                      map:
                        <<: *river_base
                        deco: {background: {color: ${getColor colors.brightred}}}
                    state == focused:
                      map:
                        <<: *river_base
                        deco: *bg_default
                    state == visible && ~occupied:
                      map:
                        <<: *river_base
                    state == visible && occupied:
                      map:
                        <<: *river_base
                        deco: *bg_default
                    state == unfocused:
                      map:
                        <<: *river_base
                    state == invisible && occupied:
                      map:
                        <<: *river_base
                        deco: {underline: {size: 4, color: ${getColor colors.palette.shade3}}}
        center:
          - clock:
              time-format: "%H:%M %Z"
              content:
                - string: {text: "{time}"}
        right:
          - network:
              name: wlo1
              poll-interval: 1000
              content:
                map:
                  default: {empty: {}}
                  conditions:
                    name == wlo1:
                      map:
                        default: {string: {text: , font: *awesome}}
                        conditions:
                          state == down: {string: {text: , font: *awesome}}
                          state == up:
                            map:
                              default:
                                - string: {text: , font: *awesome}
                                - string: {text: " {ssid}"}

                              conditions:
                                ipv4 == "":
                                  - string: {text: , font: *awesome}
                                  - string: {text: " {ssid}"}
          - battery:
              name: BAT1
              poll-interval: 30000
              anchors:
                discharging: &discharging
                  list:
                    items:
                      - ramp:
                          tag: capacity
                          items:
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                            - string: {text: , font: *awesome}
                      - string: {text: " {capacity}%"}
              content:
                map:
                  conditions:
                    state == unknown:
                      <<: *discharging
                    state == discharging:
                      <<: *discharging
                    state == charging:
                      - string: {text: , font: *awesome}
                      - string: {text: " {capacity}%"}
                    state == full:
                      - string: {text: , font: *awesome}
                      - string: {text: " {capacity}%"}
                    state == "not charging":
                      - ramp:
                          tag: capacity
                          items:
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                            - string: {text:  , font: *awesome}
                      - string: {text: " {capacity}%"}
          - label:
              content:
                string:
                  on-click: systemctl poweroff
                  text: 
                  font: *awesome
      '';
    };

    home.packages = with pkgs; [
      yambar
    ];
  };
}
