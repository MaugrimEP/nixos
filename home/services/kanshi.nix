{ ... }: {
  services.kanshi = {
    enable = true;
    profiles = {
      # Laptop only
      laptop = {
        outputs = [
          {
            criteria = "eDP-1";
            mode = "1920x1200@60.003";
            scale = 1.0;
            position = "0,0";
          }
        ];
      };

      # Laptop + 1 external monitor (DP-2)
      dual = {
        outputs = [
          {
            criteria = "eDP-1";
            mode = "1920x1200@60.003";
            scale = 1.0;
            position = "0,0";
          }
          {
            criteria = "DP-2";
            mode = "1920x1080@60.000";
            scale = 1.0;
            position = "1920,0";
          }
        ];
      };

      # Laptop + 2 Dell external monitors
      triple = {
        outputs = [
          {
            criteria = "eDP-1";
            mode = "1920x1200@60.003";
            scale = 1.0;
            position = "0,0";
          }
          {
            criteria = "Dell Inc. DELL P2419H 75Z7PM2";
            mode = "1920x1080@60.000";
            scale = 1.0;
            position = "1920,0";
          }
          {
            criteria = "Dell Inc. DELL P2419H 75L7PM2";
            mode = "1920x1080@60.000";
            scale = 1.0;
            position = "3840,0";
          }
        ];
      };
    };
  };
}
