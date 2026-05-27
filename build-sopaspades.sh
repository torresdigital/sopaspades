#!/bin/bash
# =============================================================================
#  BUILD-SOPASPADES.SH
#  Compiles SopaSpades from source on Ubuntu 20.04 / 22.04
#  Source repo  : https://github.com/atorresbr/sopaspades
#  Guide doc    : doc.txt (same folder as this script)
#  Author note  : Follow doc.txt first to understand what each step does.
# =============================================================================
#
#  HOW TO RUN:
#    chmod +x build-sopaspades.sh
#    ./build-sopaspades.sh
#
#  This script does NOT need sudo for most steps.
#  It will ask for your password only when needed (apt-get, make install).
#
#  References used to write this script:
#    CMake docs     : https://cmake.org/cmake/help/latest/
#    GCC/make docs  : https://www.gnu.org/software/make/manual/
#    apt-get docs   : https://manpages.ubuntu.com/manpages/focal/man8/apt-get.8.html
#    Ubuntu packages: https://packages.ubuntu.com/
#    OpenSpades wiki: https://github.com/yvt/openspades/wiki
# =============================================================================

# -----------------------------------------------------------------------------
# BASH SAFETY FLAGS
# -e  : exit immediately if any command returns a non-zero (error) exit code
# -u  : treat unset variables as errors (prevents silent bugs)
# -o pipefail : if any command in a pipe (cmd1 | cmd2) fails, the whole pipe
#               fails instead of silently succeeding
# Reference: https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin
# -----------------------------------------------------------------------------
set -euo pipefail

# -----------------------------------------------------------------------------
# COLOR CODES FOR TERMINAL OUTPUT
# These are ANSI escape codes supported by all modern Linux terminals.
# Reference: https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
# -----------------------------------------------------------------------------
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
CYAN='\033[1;36m'
NC='\033[0m'   # No Color — resets back to default terminal color

# -----------------------------------------------------------------------------
# HELPER FUNCTIONS
# These are small reusable functions that print colored step/status messages.
# -----------------------------------------------------------------------------

# Print a section header in cyan
step() {
    echo ""
    echo -e "${CYAN}===========================================================  ${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}===========================================================  ${NC}"
    echo ""
}

# Print a success message in green
ok() {
    echo -e "${GREEN}  [OK] $1${NC}"
}

# Print an informational message in yellow
info() {
    echo -e "${YELLOW}  [INFO] $1${NC}"
}

# Print an error message in red and exit the script
# The "exit 1" stops everything — 1 means "general error" in bash
die() {
    echo -e "${RED}  [ERROR] $1${NC}"
    exit 1
}

# -----------------------------------------------------------------------------
# CONFIGURATION VARIABLES
# Change these if you want to clone to a different folder or use a different
# build type. All other steps use these variables automatically.
# -----------------------------------------------------------------------------

# Where to clone the source code (default: ~/sopaspades)
REPO_DIR="$HOME/sopaspades"

# GitHub URL of the SopaSpades repository
REPO_URL="https://github.com/atorresbr/sopaspades.git"

# Name of the build subfolder inside the repo
# The README and doc.txt use "sopaspades.mk" — we follow that convention
BUILD_DIR="sopaspades.mk"

# CMake build type:
#   RelWithDebInfo = optimized + debug symbols (recommended)
#   Release        = maximum optimization, no debug info
#   Debug          = no optimization, full debug (very slow game)
# Reference: https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_TYPE.html
BUILD_TYPE="RelWithDebInfo"

# Modern pack zip — bundled inside the repo
MODERN_PACK_ZIP="$REPO_DIR/MODERN-PACK/modern_pack.zip"

# Where user game resources live
RESOURCES_DIR="$HOME/.local/share/sopaspades/Resources"

# =============================================================================
# MAIN SCRIPT STARTS HERE
# =============================================================================

echo ""
echo -e "${GREEN}"
echo "  ███████╗ ██████╗ ██████╗  █████╗     ███████╗██████╗  █████╗ ██████╗ ███████╗███████╗"
echo "  ██╔════╝██╔═══██╗██╔══██╗██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝"
echo "  ███████╗██║   ██║██████╔╝███████║    ███████╗██████╔╝███████║██║  ██║█████╗  ███████╗"
echo "  ╚════██║██║   ██║██╔═══╝ ██╔══██║    ╚════██║██╔═══╝ ██╔══██║██║  ██║██╔══╝  ╚════██║"
echo "  ███████║╚██████╔╝██║     ██║  ██║    ███████║██║     ██║  ██║██████╔╝███████╗███████║"
echo "  ╚══════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝    ╚══════╝╚═╝     ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝"
echo -e "${NC}"
echo "  Build script for Ubuntu 20.04 / 22.04"
echo "  Source: $REPO_URL"
echo ""

# =============================================================================
# STEP 1 — CHECK WE ARE ON A SUPPORTED SYSTEM
# =============================================================================
step "STEP 1 — Checking system compatibility"

# lsb_release -si prints the distributor (Ubuntu, Debian, etc.)
# We warn if not Ubuntu but do not stop — Debian and Mint work too.
DISTRO=$(lsb_release -si 2>/dev/null || echo "Unknown")
VERSION=$(lsb_release -sr 2>/dev/null || echo "Unknown")

info "Detected OS: $DISTRO $VERSION"

if [[ "$DISTRO" != "Ubuntu" ]]; then
    info "This script was written for Ubuntu 20.04/22.04."
    info "It may still work on Debian or Ubuntu-based distros."
    info "Continuing anyway..."
else
    ok "Ubuntu detected — fully supported."
fi

# Check that we are NOT running as root.
# Running the whole script as root is dangerous — sudo will ask only when needed.
# Reference: https://www.gnu.org/software/bash/manual/bash.html#index-EUID
if [[ "$EUID" -eq 0 ]]; then
    die "Do not run this script as root / sudo. Run as your normal user.
         The script will ask for your password only when needed."
fi

ok "Running as normal user: $(whoami)"

# =============================================================================
# STEP 2 — UPDATE PACKAGE LIST AND INSTALL BUILD TOOLS
# =============================================================================
step "STEP 2 — Updating apt and installing build tools"

# apt-get update refreshes the list of available packages from Ubuntu's servers.
# Without this, apt might try to install outdated or nonexistent package versions.
# Reference: https://manpages.ubuntu.com/manpages/focal/man8/apt-get.8.html
info "Running apt-get update..."
sudo apt-get update

# build-essential installs: gcc, g++, make, dpkg-dev, and libc headers.
# These are the minimum tools needed to compile any C/C++ project on Ubuntu.
# Reference: https://packages.ubuntu.com/focal/build-essential
info "Installing build-essential (gcc, g++, make)..."
sudo apt-get install -y build-essential

# Verify the C++ compiler is now available
if ! command -v g++ &>/dev/null; then
    die "g++ not found after installing build-essential. Check your apt setup."
fi
ok "g++ version: $(g++ --version | head -1)"

# =============================================================================
# STEP 3 — INSTALL CMAKE
# =============================================================================
step "STEP 3 — Installing CMake"

# CMake is the build system generator. It reads CMakeLists.txt and produces
# Makefiles (on Linux) or project files for other IDEs.
# SopaSpades' CMakeLists.txt requires cmake_minimum_required(VERSION 2.8).
# Ubuntu 20.04 ships cmake 3.16 which is well above that requirement.
# Reference: https://cmake.org/cmake/help/latest/
sudo apt-get install -y cmake

if ! command -v cmake &>/dev/null; then
    die "cmake not found after installation."
fi
ok "CMake version: $(cmake --version | head -1)"

# =============================================================================
# STEP 4 — INSTALL GIT
# =============================================================================
step "STEP 4 — Installing Git"

# Git is used to clone (download) the SopaSpades source code from GitHub.
# Reference: https://git-scm.com/doc
sudo apt-get install -y git

if ! command -v git &>/dev/null; then
    die "git not found after installation."
fi
ok "Git version: $(git --version)"

# =============================================================================
# STEP 5 — INSTALL ALL C++ LIBRARY DEPENDENCIES
# =============================================================================
step "STEP 5 — Installing all C++ library dependencies"

# Each library below is required by CMakeLists.txt.
# CMake will check for each one and fail with FATAL_ERROR if any is missing.
# All packages come from Ubuntu's official repositories.
#
# Package reference pages on packages.ubuntu.com:
#   libsdl2-dev        : https://packages.ubuntu.com/focal/libsdl2-dev
#   libsdl2-image-dev  : https://packages.ubuntu.com/focal/libsdl2-image-dev
#   libglew-dev        : https://packages.ubuntu.com/focal/libglew-dev
#   zlib1g-dev         : https://packages.ubuntu.com/focal/zlib1g-dev
#   libcurl4-openssl-dev: https://packages.ubuntu.com/focal/libcurl4-openssl-dev
#   libfreetype6-dev   : https://packages.ubuntu.com/focal/libfreetype6-dev
#   libopus-dev        : https://packages.ubuntu.com/focal/libopus-dev
#   libopusfile-dev    : https://packages.ubuntu.com/focal/libopusfile-dev
#   libopenal-dev      : https://packages.ubuntu.com/focal/libopenal-dev
#   libalut-dev        : https://packages.ubuntu.com/focal/libalut-dev

info "This may take several minutes on a slow connection..."

sudo apt-get install -y \
    pkg-config \
    libglew-dev \
    libcurl4-openssl-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libalut-dev \
    xdg-utils \
    libfreetype6-dev \
    libopus-dev \
    libopusfile-dev \
    imagemagick \
    libjpeg-dev \
    libxinerama-dev \
    libxft-dev \
    libopenal-dev \
    zlib1g-dev \
    unzip

ok "All dependencies installed."

# Quick spot-check: verify the most critical dev packages are present
# dpkg -s exits 0 if the package is installed, non-zero otherwise
for pkg in libsdl2-dev libglew-dev libopus-dev libfreetype6-dev; do
    if dpkg -s "$pkg" &>/dev/null; then
        ok "$pkg is installed"
    else
        die "$pkg failed to install. Run: sudo apt-get install -y $pkg"
    fi
done

# =============================================================================
# STEP 6 — CLONE THE SOPA SPADES SOURCE CODE
# =============================================================================
step "STEP 6 — Cloning SopaSpades source code"

# If the repo folder already exists we skip cloning and just update it.
# "git pull" downloads any new commits since the last clone.
if [[ -d "$REPO_DIR/.git" ]]; then
    info "Repo already exists at $REPO_DIR — running git pull to update..."
    git -C "$REPO_DIR" pull
    ok "Repository updated."
elif [[ -d "$REPO_DIR" ]]; then
    # Folder exists but is not a git repo — could be the local copy
    # already in ~/Desktop/pythons/sopaspades-main
    info "Folder $REPO_DIR exists but is not a git repo. Using it as-is."
else
    info "Cloning from $REPO_URL ..."
    # git clone downloads the entire repository into REPO_DIR
    # Reference: https://git-scm.com/docs/git-clone
    git clone "$REPO_URL" "$REPO_DIR"
    ok "Repository cloned to $REPO_DIR"
fi

# Make sure CMakeLists.txt is present — this is the most important file
if [[ ! -f "$REPO_DIR/CMakeLists.txt" ]]; then
    die "CMakeLists.txt not found in $REPO_DIR. Clone may have failed."
fi
ok "CMakeLists.txt found."

# =============================================================================
# STEP 7 — CONFIGURE THE PROJECT WITH CMAKE
# =============================================================================
step "STEP 7 — Configuring with CMake"

# Enter the source directory
cd "$REPO_DIR"

# Create the build folder if it does not exist yet
# Keeping build files separate from source is a CMake best practice.
# If it exists with a stale cache, we clean it first to avoid errors.
if [[ -d "$BUILD_DIR/CMakeCache.txt" ]] || [[ -f "$BUILD_DIR/CMakeCache.txt" ]]; then
    info "Stale CMake cache detected — cleaning build folder..."
    rm -rf "$BUILD_DIR"
fi

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

info "Running cmake with build type: $BUILD_TYPE"
info "CMake will now search for all installed libraries..."

# cmake .. means "read CMakeLists.txt from the parent directory (..)"
# -DCMAKE_BUILD_TYPE sets optimization level:
#   RelWithDebInfo = -O2 optimization + debug symbols (-g)
# Reference: https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_TYPE.html
cmake .. -DCMAKE_BUILD_TYPE="$BUILD_TYPE"

ok "CMake configuration successful."
info "Build files written to: $(pwd)"

# =============================================================================
# STEP 8 — COMPILE WITH MAKE
# =============================================================================
step "STEP 8 — Compiling SopaSpades"

# nproc prints the number of logical CPU cores available.
# make -j$(nproc) runs that many parallel compile jobs, cutting build time.
# Reference: https://www.gnu.org/software/make/manual/make.html#Parallel
CORES=$(( $(nproc) > 1 ? $(nproc) - 1 : 1 ))
info "Compiling with $CORES of $(nproc) cores (1 kept free for system)..."
info "This takes 5 to 30 minutes depending on your CPU. Please wait..."

make -j"$CORES"

# Verify the binary was produced
if [[ ! -f "bin/sopaspades" ]]; then
    die "Compilation finished but bin/sopaspades not found. Check errors above."
fi

ok "Compilation complete!"
ok "Binary located at: $REPO_DIR/$BUILD_DIR/bin/sopaspades"

# =============================================================================
# STEP 9 — INSTALL SYSTEM-WIDE
# =============================================================================
step "STEP 9 — Installing SopaSpades system-wide"

# sudo make install copies files to:
#   /usr/local/games/sopaspades         (the game binary)
#   /usr/local/share/games/openspades/  (game resources)
#   /usr/local/share/applications/      (desktop launcher)
#   /usr/local/share/icons/             (app icons)
# After this, typing "sopaspades" in any terminal launches the game.
# Reference: see OPENSPADES_INSTALL_* variables in CMakeLists.txt
info "Running sudo make install..."
sudo make install

# Verify the binary is in the system PATH
if command -v sopaspades &>/dev/null; then
    ok "sopaspades is now available system-wide."
else
    info "Binary not found in PATH yet. You can still run it directly:"
    info "  $REPO_DIR/$BUILD_DIR/bin/sopaspades"
fi

# =============================================================================
# BONUS — INSTALL THE MODERN PACK (weapon skins)
# =============================================================================
step "BONUS — Installing MODERN-PACK weapon skins"

# The MODERN-PACK adds new weapon model skins.
# It is bundled inside the repo at MODERN-PACK/modern_pack.zip
# We extract it to ~/.local/share/sopaspades/Resources/ which the game
# checks automatically for user-level resource overrides.

if [[ -f "$MODERN_PACK_ZIP" ]]; then
    info "Creating resources directory: $RESOURCES_DIR"
    mkdir -p "$RESOURCES_DIR"

    info "Extracting modern_pack.zip..."
    # unzip -o overwrites existing files without prompting
    # -d sets the destination directory
    # Reference: https://linux.die.net/man/1/unzip
    unzip -o "$MODERN_PACK_ZIP" -d "$RESOURCES_DIR"

    ok "MODERN-PACK installed to $RESOURCES_DIR"
else
    info "MODERN-PACK zip not found at $MODERN_PACK_ZIP — skipping."
    info "You can install it later manually from the repo."
fi

# =============================================================================
# DONE
# =============================================================================
echo ""
echo -e "${GREEN}"
echo "  ╔══════════════════════════════════════════════╗"
echo "  ║  BUILD COMPLETE — Bom jogo! 🍜 Sopa! 🔫🇧🇷  ║"
echo "  ╚══════════════════════════════════════════════╝"
echo -e "${NC}"
echo "  To start the game, run:"
echo ""
echo "      sopaspades"
echo ""
echo "  Or run directly without installing:"
echo "      $REPO_DIR/$BUILD_DIR/bin/sopaspades"
echo ""
echo "  If the game crashes on audio, install OpenAL:"
echo "      sudo apt-get install -y libopenal1"
echo ""
echo "  Full troubleshooting guide: doc.txt"
echo "  Source: $REPO_URL"
echo ""
