{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./xmonad.nix
      ./dropbox.nix
      ./synergy.nix
      ./samba.nix
      ./tmux.nix
      ./redshift.nix
    ];

 # Use the systemd-boot EFI boot loader.
  boot.loader = {
    #systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      extraEntries = ''
        menuentry "Hackintosh BOOTx64" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root 0AAD-D8F2
          chainloader /EFI/BOOT/BOOTx64.efi
        }
      '';
      version = 2;
      #useOSProber = true;
    };
  };

  networking = {
    hostName = "k6-nixos";
    domain = "local.cwzhou.win";
    useDHCP = false;
    interfaces.enp6s0.ipv4.addresses = [{
        address = "192.168.199.19";
        prefixLength = 28;
      }];
    defaultGateway = "192.168.199.1";
    nameservers = [ "192.168.199.20" "192.168.199.8" ];
    networkmanager.enable = true;
     i18n = {
       consoleFont = "Lat2-Terminus16";
       consoleKeyMap = "us";
       defaultLocale = "en_US.UTF-8";
     };
  };

  location = {
    provider = "manual";
    latitude = -33.8718;
    longitude = 151.2494;
  };

  # pinyin input
 i18n.inputMethod = {
  enabled = "fcitx";
  fcitx.engines = with pkgs.fcitx-engines; [ cloudpinyin libpinyin];
};

  # Set your time zone.
 time.timeZone = "Australia/Sydney";


  # List packages installed in system profile. To search, run:
 # nix search wget
  environment.systemPackages = with pkgs; [
    wget vim firefox 
    oh-my-zsh git curl
    gnome3.gedit gnome3.nautilus
    neovim tmux unrar
    unzip zsh alacritty
    ag thunderbird chromium
    which htop xscreensaver
    which ag networkmanagerapplet
    nix-prefetch-scripts redshift
    vagrant arandr
    lxqt.lxqt-policykit
    vlc
    geeqie
    mplayer
    dropbox-cli
    spotify
    emacs26
    darktable
    synergy
    slack
    libreoffice
    jq
    shutter scrot
    zathura
    xclip
    ethtool
    nnn gparted
  ];

  environment.variables.GIO_EXTRA_MODULES = [ "${pkgs.gvfs}/lib/gio/modules" ]; # lets PCManFM discover gvfs modules

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  # configuration for zsh

 # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.gnome3.gvfs.enable = true; # enables gvfs<Paste>

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.szhou= {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" ]; # Enable ‘sudo’ for the user.
     home = "/home/szhou";
     shell = pkgs.zsh;
   };
  security.sudo.wheelNeedsPassword = false;
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "21.05"; # Did you read the comment?
  nixpkgs.config = {
    allowUnfree = true;
  };
  hardware.enableAllFirmware = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  
  # virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  # font copy from http://bit.ly/2tl4BVV
  fonts = {
    fontconfig.enable = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      wqy_microhei
      wqy_zenhei
    ];
  };
