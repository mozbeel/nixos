{
  services.udev.extraRules = ''
    KERNEL=="hidraw*", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006e", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006e", TAG+="uaccess"
  '';

  boot.blacklistedKernelModules = [ "wacom" "hid_uclogic" ];
}
