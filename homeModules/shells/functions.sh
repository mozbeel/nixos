mkcd() {
  mkdir -p "$1" && cd "$1"
}

export LD_LIBRARY_PATH="$HOME/.local/share/Steam/steamapps/common/tModLoaderDev/Libraries/FNA/1.0.0:$HOME/.local/share/Steam/steamapps/common/tModLoaderDev:$LD_LIBRARY_PATH"

