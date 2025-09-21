{
  home.file.".config/wireplumber/wireplumber.conf.d/51-disable-agc.conf" = {
    text = ''
      monitor.alsa.rules = [
        {
          matches = [
            {
              "node.name" = "alsa_input.pci-0000_0b_00.4.analog-stereo"
            }
          ]
          actions = {
            "update-props" = {
              "alsa.agc.enable" = false
            }
          }
        }
      ]
    '';
  };
}
