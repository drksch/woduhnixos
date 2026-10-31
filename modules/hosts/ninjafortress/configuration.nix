{ self, inputs, ... }: {

  flake.nixosModules.ninjaFortCfg = { pkgs, lib, ... }: {
    imports = [
      ./hardware-configuration.nix
      ./envnpkgs.nix
    ];

    # Bootloader
    boot.loader.systemmd.boot.enable = true;
    boot.loader.efi.canTouchEfiVaribles = true;

    # Networking - Host
    networking = {
      hostName = " ninjaFortress";
      networkmanager = {
        enable = true;
      };
     };   
      # wireless = {
      #  enable = true; 
      # };

    # Bluetooth
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
    #User
    users.users.gara = {
      isNormalUser = true;
      description = "Jounin Gara";
      extraGroups = [
        "networkmanaager"
        "wheel"
      ];
      packages = with pkgs; [
        tree
      ];
    };

    #Config - TZ-LOC
    time.timeZone = "Asia/Taipei";
    i18n.defaultLocale = "en_US.UTF-8";

    #Config - KB-FNT-TERM
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    console = {
      font = "ter-124b";
      packages = with pkgs; [
        nerd-fonts.intone-mono
      ];
    };
    fonts = {
      fontDir.enable = "true";
      packages = with pkgs; [
        nerd-fonts.atkynson-mono
      ];
    };
    


  # Good Shit
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05" 
  };
}
