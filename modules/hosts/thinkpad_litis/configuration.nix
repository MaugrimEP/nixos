{ self, inputs, ... }: {
  flake.nixosModules.thinkpad_litisConfiguration = { config, pkgs, lib, ... }: {

imports = [
  self.nixosModules.thinkpad_litisHardware
  self.nixosModules.mykeyboard
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

# Enable nix-ld for running unpatched dynamic binaries
programs.nix-ld.enable = true;

# Fonts
fonts.packages = with pkgs; [
  dejavu_fonts
  liberation_ttf
  nerd-fonts.fira-code
  nerd-fonts.jetbrains-mono
];

system.stateVersion = "25.11";

};
}
