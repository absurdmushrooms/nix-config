{ pkgs, ... }:

pkgs.python3Packages.buildPythonApplication rec {
  pname = "something-x";
  version = "1.10.0";

  pyproject = true;
  build-system = with pkgs.python3Packages; [ setuptools setuptools-scm ];

  src = pkgs.fetchFromGitHub {
    owner = "SoaOaoS";
    repo = "something-x";
    rev = "main";
    hash = "sha256-ZLQdFGzHSoM9UUD4r8JNotOBjBcsQDiPFvPc7xUlctY=";
  };

  nativeBuildInputs = with pkgs; [
    gobject-introspection
    wrapGAppsHook4
  ];

  buildInputs = with pkgs; [
    gtk4
    libadwaita
  ];

  dependencies = with pkgs.python3Packages; [
    pygobject3
    dbus-python
    pycairo
  ];

  meta = {
    description = "A Linux-native companion app for Nothing and CMF Bluetooth devices";
    homepage = "https://github.com/SoaOaoS/something-x";
    mainProgram = "something-x";
  };
}
