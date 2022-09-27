# Checking if package is installed else install it
function checkOrInstall() {
    PKG_NAME=$1
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $PKG_NAME)

    if [ "install ok installed" != "$PKG_OK" ]; then
        echo "No $PKG_NAME. Setting up $PKG_NAME."
        sudo apt install -y $PKG_NAME
    fi
}
