{config, pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty
    librewolf
    lazygit
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
    };
    xfwm4 = {
      "general/button_layout" = "CMHS|O";
    };
  };

  home.stateVersion = "25.05"; 
}
