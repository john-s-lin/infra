{ ... }:
{
  programs.bottom = {
    enable = true;

    settings = {

      # Flags
      flags = {
        battery = true;
        tree = true;
      };

      # Layout
      row = [
        {
          child = [
            {
              ratio = 3;
              type = "cpu";
            }
            {
              ratio = 2;
              type = "battery";
            }
          ];
        }
        {
          child = [
            {
              ratio = 3;
              type = "mem";
            }
            {
              ratio = 2;
              child = [
                { type = "temp"; }
                { type = "disk"; }
              ];
            }
          ];
        }
        {
          child = [
            { type = "net"; }
            { type = "proc"; }
          ];
        }
      ];

      # Disk Filter
      diskFilter = {
        isListIgnored = true;
        list = [
          "/dev/disk1s2"
          "/dev/disk1s4"
          "/dev/disk1s5"
          "/dev/disk1s6"
        ];
      };

      # Mount Filter
      mountFilter = {
        isListIgnored = true;
        list = [
          "/System/Volumes/iSCPreboot"
          "/System/Volumes/Hardware"
          "/System/Volumes/Data"
          "/System/Volumes/Update"
          "/System/Volumes/Preboot"
          "/System/Volumes/VM"
        ];
      };
    };
  };
}
