#!/bin/bash


# usage:
# ./app.sh -i pip-package-requests.zip # install the package in from the zip file
# ./app.sh -d requests # downloads the package and puts it in a zip file

download_package() {
    if [ -z "$1" ]; then
        echo "No package name provided for download."
        exit 1
    fi
    package_name=$1
    temp_dir=$(mktemp -d)
    pip download --no-deps --dest "$temp_dir" "$package_name"
    zip -r "pip-package-$package_name.zip" "$temp_dir"
    rm -rf "$temp_dir"
    echo "Package $package_name has been downloaded and saved as pip-package-$package_name.zip"
}

install_package() {
    if [ -z "$1" ]; then
        echo "No zip file provided for installation."
        exit 1
    fi

    zip_file=$1
    temp_dir=$(mktemp -d)
    unzip "$zip_file" -d "$temp_dir"
    wheel_file=$(find "$temp_dir" -name "*.whl" | head -n 1)
    if [ -n "$wheel_file" ]; then
        pip install "$wheel_file"
        echo "Package from $wheel_file has been installed."
    else
        echo "No .whl file found in the zip archive."
        exit 1
    fi
    rm -rf "$temp_dir"

    echo "The temporary folder has been removed."
}

# Main
main(){
if [ "$1" == "-d" ] && [ -n "$2" ]; then
    download_package "$2"
elif [ "$1" == "-i" ] && [ -n "$2" ]; then
    install_package "$2"
else
    echo "Invalid usage. Use -d <package-name> to download or -i <zip-file> to install."
    exit 1
fi
}