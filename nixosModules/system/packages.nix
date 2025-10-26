{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nvd

    just
    jq

    gcc
    gnumake
    glib
    glibc
    cargo
    rustc
    nil
    file
    cron
    screen

    dysk
    pv

    vulkan-tools
    vulkan-loader
    mesa
    mesa-demos
    zig
  ];

  environment.variables.VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
}
