#!/bin/bash

arch=$(uname -p)

if [ "$arch" = "aarch64" ]; then
  wget https://github.com/Lrdsnow/zelda-fangame/releases/download/0.1prewhatever/zelda_linux.arm64 -qq --show-progress -O ~/.lmt/bin/zelda
elif [ "$arch" = "x86_64" ]; then
  wget https://github.com/Lrdsnow/zelda-fangame/releases/download/0.1prewhatever/zelda_linux.x86_64 -qq --show-progress -O ~/.lmt/bin/zelda
else
  echo "Unsupported architecture: $arch"
  exit 1
fi

chmod 755 ~/.lmt/bin/zelda
