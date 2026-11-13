{ config, pkgs, ... }:

let
  gh-copilot-cli = pkgs.callPackage ./pkgs/gh-copilot-cli.nix {};
in
{
  imports = [ <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix> ];
  programs.nix-ld.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.vm = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "vm";
  };

  environment.systemPackages = with pkgs; [
    git
    maven
    jdk21_headless
    cargo
    rustc
    nodejs_22
    gh-copilot-cli
  ];

  virtualisation.sharedDirectories = {
    lp-framework = {
      source = "/home/daana/git/lp-framework/";
      # securityModel = "";
      target = "/lp-framework";
    };
  };

  system.stateVersion = "24.05";
}
