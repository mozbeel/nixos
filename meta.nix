rec {
  stateVersion = "25.05";

  dir = "/home/${user.name}/nixos";

  user = {
    name = "leeb";
    fullName = "Matthias Leeb";
  };

  domain = "motzi.at";

  git = {
    username = "mozbeel";
    email = "matthiasleeb4@gmail.com";
  };

  time = {
    zone = "Europe/Vienna";
  };

  keyboard = {
    layout = "us";
    variant = ",qwerty";
  };

  cuda = false;
}
