{ self, inputs, ... }: {
  flake.nixosModules.thinkpad_litisConfiguration = { config, pkgs, lib, ... }: {

imports = [
  self.nixosModules.thinkpad_litisHardware
  self.nixosModules.mykeyboard
  self.nixosModules.nvidia
];

# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "nixos";

# Enable networking
networking.networkmanager.enable = true;

# Set your time zone.
time.timeZone = "Europe/Paris";

# Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";

i18n.extraLocaleSettings = {
  LC_ADDRESS = "fr_FR.UTF-8";
  LC_IDENTIFICATION = "fr_FR.UTF-8";
  LC_MEASUREMENT = "fr_FR.UTF-8";
  LC_MONETARY = "fr_FR.UTF-8";
  LC_NAME = "fr_FR.UTF-8";
  LC_NUMERIC = "fr_FR.UTF-8";
  LC_PAPER = "fr_FR.UTF-8";
  LC_TELEPHONE = "fr_FR.UTF-8";
  LC_TIME = "fr_FR.UTF-8";
};

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

# Enable bluetooth.
hardware.bluetooth = {
  enable = true;
  powerOnBoot = false;
  settings = {
    General = {
      # Shows battery charge of connected devices on supported
      # Bluetooth adapters. Defaults to 'false'.
      Experimental = true;
      # When enabled other devices can connect faster to us, however
      # the tradeoff is increased power consumption. Defaults to
      # 'false'.
      FastConnectable = true;
    };
    Policy = {
      # Enable all controllers when they are found. This includes
      # adapters present on start as well as adapters that are plugged
      # in later on. Defaults to 'true'.
      AutoEnable = true;
    };
  };
};

# Define a user account.
users.users.tmayet = {
  isNormalUser = true;
  description = "tmayet";
  shell = pkgs.zsh;
  extraGroups = [ "networkmanager" "wheel" ];
};

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# Enable flakes and nix-command globally
nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Enable zsh at system level (required for login shell)
programs.zsh.enable = true;

services.displayManager.defaultSession = "niri";

services.gnome.gnome-keyring.enable = true;
security.pam.services.gdm.enableGnomeKeyring = true;
security.pam.services.sddm.enableGnomeKeyring = true;
security.pam.services.login.enableGnomeKeyring = true;

# Askpass program for SSH agent confirmation prompts
programs.ssh.askPassword = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";

# Enable nix-ld for running unpatched dynamic binaries
programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [
  python3
];

# Fonts
fonts.packages = with pkgs; [
  dejavu_fonts
  liberation_ttf
  nerd-fonts.fira-code
  nerd-fonts.jetbrains-mono
  noto-fonts-color-emoji
];

system.stateVersion = "25.11";

};
}
