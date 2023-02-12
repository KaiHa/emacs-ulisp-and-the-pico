{ pkgs ? import <nixpkgs> { }}:

pkgs.mkShell {
  packages = with pkgs; [
    arduino-cli
  ];
}
