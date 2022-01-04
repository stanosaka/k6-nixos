{ config, pkgs, ... }:
{

  # Samba client cifs mount
  # NAS1 
  fileSystems."/mnt/nas1/Animation" = {
      device = "//nas1.local.cwzhou.win/Animation";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/classicMovie" = {
      device = "//nas1.local.cwzhou.win/classicMovie";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/Documentaries" = {
      device = "//nas1.local.cwzhou.win/Documentaries";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/movie01" = {
      device = "//nas1.local.cwzhou.win/movie01";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/music" = {
      device = "//nas1.local.cwzhou.win/music";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/photo" = {
      device = "//nas1.local.cwzhou.win/photo";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/recent" = {
      device = "//nas1.local.cwzhou.win/recent";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/tvseries" = {
      device = "//nas1.local.cwzhou.win/tvseries";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/video" = {
      device = "//nas1.local.cwzhou.win/video";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/usbshare1-1" = {
      device = "//nas1.local.cwzhou.win/usbshare1-1";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas1/usbshare1-2" = {
      device = "//nas1.local.cwzhou.win/usbshare1-2";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };

  # NAS2
  fileSystems."/mnt/nas2/data" = {
      device = "//nas2.local.cwzhou.win/data";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas2/devops" = {
      device = "//nas2.local.cwzhou.win/devops";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };
  fileSystems."/mnt/nas2/Pictures" = {
      device = "//nas2.local.cwzhou.win/Pictures";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},uid=1000,credentials=/etc/nixos/smb-secrets"];
  };

}
