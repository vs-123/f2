{config, pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty
    librewolf
    flameshot
    fastfetch
    lazygit
    btop
    xorg.xrandr
    libxcvt
    cool-retro-term
    clang-tools
    llvmPackages.clang
    cmake
    gnumake
    python3
    rmlint
  ]; 

  programs = {
    git = {
      enable = true;
      package = pkgs.gitFull;
      settings = {
        user.name = "vs-123";
        user.email = "";
      };
    }; 
  };

  home.file = {
    ".bashrc".source = ./dfs/bashrc;
    ".config/vim" = {source = ./dfs/cfg/vim; recursive = true;};
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  xfconf.settings = {
    keyboards = {
      "Default/KeyRepeat/Delay" = 200;
      "Default/KeyRepeat/Rate" = 50;
    };

    xfce4-keyboard-shortcuts = {
      "commands/custom/<Alt>s" = "xfce4-appfinder";
      "commands/custom/<Alt><Shift>s" = "flameshot gui";
      "xfwm4/custom/<Alt>w" = "close_window_key";
    };

    xfwm4 = {
      "general/button_layout" = "CMHS|O";
      "general/frame_opacity" = 90;
      "general/inactive_opacity" = 90;
    };

    xfce4-panel = {
      panels = [1];
    };
  };

  home.stateVersion = "25.05"; 
}
