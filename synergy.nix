{ config, pkgs, ... }:
{
  # synergy
  services = {
    synergy.server = {
       enable = true;
       autoStart = true;
       screenName = "toad-zhou";
       address = "192.168.199.181";
       configFile = "/etc/synergy-server.conf";
    };
  };
 # setup synergy.nix
 environment.etc."synergy-server.conf" = { text = ''
  section: screens
    ipscape-szhou:
  	toad-szhou:
  end
  section: aliases
    ipscape-szhou:
      192.168.199.176
  	toad-szhou:
      192.168.199.181
	section: links
    ipscape-szhou:
			right = toad-zhou
		toad-szhou:
			left = ipscape-szhou
	end
  ''; };
}
