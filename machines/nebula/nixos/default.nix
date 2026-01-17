{
  meta,
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ../../../presets/desktop/nixos
    ./hardware-configuration.nix
  ];

  home-manager.users.${meta.user.name} = import ../home {
    inherit inputs pkgs pkgs-unstable;
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  environment.systemPackages = with pkgs; [
    clinfo
    blender-hip
    rocmPackages.hipcc
    # rocmPackages.hiprt
    rocmPackages.hip-common
    rocmPackages.hipfft
    rocmPackages.hipify
    rocmPackages.hipcub
    rocmPackages.hiprand
    rocmPackages.hipfort
    rocmPackages.hipblas
    rocmPackages.hipblaslt
    rocmPackages.hipsparse
    rocmPackages.hipsolver
    rocmPackages.hipblas-common
    fna3d
    # linuxKernel.packages.linux_6_6.perf
    perf
    glfw
    mesa
    driversi686Linux.mesa
    wayland
    libx11
    libGLU
  ];
}
