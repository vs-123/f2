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
      userName = "vs-123";
      userEmail = "";
    }; 
  };

  home.file = {
    ".bashrc" = ./dfs/bashrc;
    ".config/vim" = {source = ./dfs/cfg/vim; recursive = true;};
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.stateVersion = "25.05"; 
}
