#/bin/bash

### don't forget to run: chmod +x install_apps.sh ###

install_homebrew() {
    if [[ $(uname) == "Darwin" ]]; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Not macOS, skipping Homebrew installation."
    fi
}

install_package() {
    if [[ $(uname) == "Darwin" ]]; then
        brew install $1
    else
        sudo apt-get install -y $1
    fi
}

install_homebrew

### standard commands:
echo "Installing Vim..."
install_package vim

echo "Installing Visual Studio Code..."
install_package visual-studio-code

echo "Installing Slack..."
install_package slack

echo "Installing Brave Browser..."
install_package brave-browser

echo "Installing Java..."
install_package default-jre

### special case commands that need separate checks:
echo "Installing Rust..."
if [[ $(uname) == "Darwin" ]]; then
    brew install rust
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

echo "Installing Golang..."
if [[ $(uname) == "Darwin" ]]; then
    brew install go
else
    sudo apt-get install -y golang-go
fi
