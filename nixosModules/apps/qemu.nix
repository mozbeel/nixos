{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.qemu
    pkgs.iproute2
  ];

  services.spice-vdagentd.enable = true;
  # Time syncing and scripting
  services.qemuGuest.enable = true;

  # VirtFS alternative for directory sharing
  services.spice-webdavd.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
