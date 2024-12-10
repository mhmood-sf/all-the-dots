# NOTE: Custom builds of Iosevka try to use ALL CPUs, and have a very high
# RAM usage, which often leads to out-of-memory issues. When building this
# package, use --cores N to limit the number of cores (and RAM) used.
# However, doing this will take longer to build.

{ iosevka }:
iosevka.override {
  set = "Term";
  # See https://typeof.net/Iosevka/customizer
  privateBuildPlan = ''
    [buildPlans.IosevkaTerm]
    family = "Iosevka"
    spacing = "term"
    serifs = "sans"
    noCvSs = true
    exportGlyphNames = false

    [buildPlans.IosevkaTerm.variants.design]
    capital-delta = "straight"
    lower-delta = "flat-top"
    lower-lambda = "curly-tailed-turn"
    lower-chi = "semi-chancery-straight-serifless"
    asterisk = "penta-low"

      [buildPlans.IosevkaTerm.ligations]
      inherits = "dlig"

    [buildPlans.IosevkaTerm.weights.Regular]
    shape = 400
    menu = 400
    css = 400

    [buildPlans.IosevkaTerm.weights.Medium]
    shape = 500
    menu = 500
    css = 500

    [buildPlans.IosevkaTerm.weights.SemiBold]
    shape = 600
    menu = 600
    css = 600

    [buildPlans.IosevkaTerm.weights.Bold]
    shape = 700
    menu = 700
    css = 700

    [buildPlans.IosevkaTerm.weights.ExtraBold]
    shape = 800
    menu = 800
    css = 800

    [buildPlans.IosevkaTerm.slopes.Upright]
    angle = 0
    shape = "upright"
    menu = "upright"
    css = "normal"

    [buildPlans.IosevkaTerm.slopes.Italic]
    angle = 9.4
    shape = "italic"
    menu = "italic"
    css = "italic"
  '';
}
