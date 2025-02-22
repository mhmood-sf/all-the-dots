{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

# Enable Flakes.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "snowman-ms"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Persist volume across shutdowns.
  # hardware.alsa.enablePersistence = true;

  # Enable bluetooth.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  users.mutableUsers = false;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.atlin = {
    isNormalUser = true;
    description = "Mahmood S";
    hashedPassword = "$6$i2lxnysB.fCdLfvm$zi4IOB95neMt97OoOwNeQnNyxBms6xoJ6QGdx5CQNyk1TYS2VOIprQnoeRGPaW4ks64gJvoWkcjD7kSghxO741";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.users.guest = {
    isNormalUser = true;
    description = "Guest User";
    password = "guest";
    extraGroups = [ "networkmanager" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List of permitted insecure packages
  # nixpkgs.config.permittedInsecurePackages = [ ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    acpi
    # ???
    linuxPackages.perf
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;
    # GVFS
    gvfs.enable = true;
    # Power Management
    tlp.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = false;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
