{ config, pkgs, ... }:
{
  services.openssh.enable = true;
  virtualisation.docker.enable = true;

  nix = {
   package = pkgs.nixFlakes;
   extraOptions = ''
     experimental-features = nix-command flakes
   '';
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "DroidSansMono" "FiraCode" "FiraMono"]; })
  ];

  environment.systemPackages = with pkgs; [
    exfat ntfs3g
    unzip
    curl wget
    openssl bind gnupg
    iputils
    htop
    file
    ripgrep
    git
    neovim
    tree
    jq
    direnv
  ];
}
