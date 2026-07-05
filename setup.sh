#!/bin/sh

# Package managers
sudo apt update
sudo apt install -y git flatpak snapd

sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub

#     Wine
#     Also install in wine: FEMM, LTSpice, PrePoMax
flatpak install org.winehq.Wine

# Kicad PCB CAD
#    Install plugins manually: replicate-layout, jlcpcb production, Project Instances
sudo add-apt-repository -y ppa:kicad/kicad-10.0-releases
sudo apt update
sudo apt install -y kicad

# FreeCAD mechanical CAD
sudo snap install -y freecad

# FreeCAD-compatible FEM toolchain
sudo apt update
sudo apt install -y calculix-ccx calculix-cgx paraview
echo "Consider setting up Elmer FEM and Code-Aster/Salome-Meca FEM tools"

# Protocase enclosure CAD
sudo apt update
sudo apt install -y openjdk-8-jre
echo "Continue protocase designer install manually per https://www.protocasedesigner.com/download/uninstall-instructions.php "

# GMSH meshing tool
sudo apt install -y gmsh

# VScode IDE
sudo snap install -y code --classic

# Make an SSH key to use with github
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N "" -q

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.bashrc

# Python
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.bashrc

# Embedded dev tools
#    Ability to connect to USB probes
sudo apt install -y libusb-1.0-0-dev

#    ARM toolchain
sudo apt install gcc-arm-none-eabi gdb-multiarch

#    Rust tools
rustup component add rust-src
cargo install flip-link tokei cargo-show-asm
rustup target add thumbv7em-none-eabihf

#    Probe-rs
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/probe-rs/probe-rs/releases/latest/download/probe-rs-tools-installer.sh | sh

#    PuTTY serial interface
sudo add-apt-repository -y universe
sudo apt update
sudo apt install -y putty

# Dev tools
#    Codex
curl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh

#    Perf tools
sudo apt install -y valgrind kcachegrind strace linux-tools-$(uname -r) linux-tools-generic 

