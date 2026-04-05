{ self, inputs, ... }:
{
  flake.nixosModules.nvidia =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {

      # Enable OpenGL
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      # Load NVIDIA driver
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {
        # Use the stable open-source kernel module (recommended for Turing+ GPUs)
        open = true;

        # Modesetting is required for Wayland compositors (Hyprland, GNOME Wayland)
        modesetting.enable = true;

        # Power management — helps with suspend/resume on laptops
        powerManagement.enable = true;
        powerManagement.finegrained = true;

        # PRIME offload for hybrid Intel+NVIDIA laptops
        # Renders on Intel by default, use `nvidia-offload` wrapper for NVIDIA
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
        };

        # Use the stable driver package
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
}
