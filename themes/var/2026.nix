rec {
  rounding = 12;
  gaps-in = 4;
  gaps-out = gaps-in * 1.5;
  active-opacity = 1;
  inactive-opacity = 0.96;
  blur = true;
  border-size = 2;
  animation-speed = "medium"; # "fast" | "medium" | "slow"
  fetch = "neofetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"

  bar = {
    position = "top";
    transparent = true;
    transparentButtons = false;
    floating = true;
  };
}
