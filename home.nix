{config, pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty
    librewolf
    lazygit
  ]; 

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "vs-123";
    userEmail = "";
  }; 

  home.file = {
    ".bashrc".source = ./dfs/bashrc;
  };

  home.stateVersion = "25.05"; 
}
