{ lib, ... }:
{
  imports = lib.scanPaths ./.;
}
