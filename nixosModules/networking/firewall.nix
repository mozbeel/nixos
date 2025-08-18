{ lib, ... }:

{
  networking.firewall.enable = lib.mkDefault true;
  networking.firewall.allowedTCPPorts = [ 9757 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
}
