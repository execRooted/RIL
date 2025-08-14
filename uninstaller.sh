#!/bin/bash
set -e
clear

echo "=== RIL Uninstaller ==="

# Function to detect Linux family
detect_linux() {
    if command -v pacman &> /dev/null; then
        echo "Arch"
    elif command -v apt &> /dev/null; then
        echo "Debian"
    elif command -v dnf &> /dev/null; then
        echo "Fedora"
    elif command -v zypper &> /dev/null; then
        echo "Opensuse"
    else
        echo "Unsupported OS"
        exit 1
    fi
}

LINUX_FAMILY=$(detect_linux)
echo "Detected Linux family: $LINUX_FAMILY"

# Remove the RIL executable
if [ -f /usr/local/bin/RIL/ren ]; then
    echo "Removing /usr/local/bin/RIL/ren..."
    sudo rm /usr/local/bin/RIL/ren
    echo "RIL executable removed."
else
    echo "RIL executable not found in /usr/local/bin/RIL."
fi

# Remove the symlink
if [ -L /usr/local/bin/ren ]; then
    echo "Removing /usr/local/bin/ren symlink..."
    sudo rm /usr/local/bin/ren
    echo "Symlink removed."
else
    echo "Symlink /usr/local/bin/ren not found."
fi

# Optionally remove .NET SDK (ask user first)
if command -v dotnet &> /dev/null; then
    read -p "Do you want to remove the .NET SDK? [y/N]: " REMOVE_DOTNET
    if [[ "$REMOVE_DOTNET" =~ ^[Yy]$ ]]; then
        case "$LINUX_FAMILY" in
            Arch)
                sudo pacman -Rns --noconfirm dotnet-sdk
                ;;
            Debian)
                sudo apt remove --purge -y dotnet-sdk-7.0
                sudo apt autoremove -y
                ;;
            Fedora)
                sudo dnf remove -y dotnet-sdk-7.0
                ;;
            Opensuse)
                sudo zypper remove -y dotnet-sdk-7.0
                ;;
        esac
        echo ".NET SDK removed."
    else
        echo "Skipped removing .NET SDK."
    fi
else
    echo ".NET SDK not found, nothing to remove."
fi

# Remove the RIL directory if empty
if [ -d /usr/local/bin/RIL ]; then
    if [ -z "$(ls -A /usr/local/bin/RIL)" ]; then
        sudo rmdir /usr/local/bin/RIL
        echo "Removed empty /usr/local/bin/RIL directory."
    else
        echo "/usr/local/bin/RIL directory not empty, left intact."
    fi
fi

echo "=== RIL uninstallation complete ==="
