# pip-tool

This script allows you to download a Python package and archive it into a `.zip` file or install a package directly from a `.zip` file.

## Usage

### Download a Package into a `.zip` File

To download a Python package and save it as a `.zip` file for later installation, run the following command:

```bash
./pip-tool.sh -d <package-name>
```

**Example:**
```bash
./pip-tool.sh -d requests
```

This will download the `requests` package and create a file called `pip-package-requests.zip` containing the package.

### Install a Package from a `.zip` File

To install a package from a `.zip` file that contains the package (such as `requests`), use the `-i` flag with the `.zip` file as an argument:

```bash
./pip-tool.sh -i <zip-file>
```

**Example:**
```bash
./pip-tool.sh -i pip-package-requests.zip
```

This will unzip the `.zip` file, find the `.whl` (wheel) file inside, and install the package using `pip`.

## Script Breakdown

- **`-d <package-name>`**: Downloads the specified package using `pip`, archives it into a `.zip` file, and saves it in the current directory.
- **`-i <zip-file>`**: Unzips the specified `.zip` file, installs the `.whl` file inside using `pip`, and then removes the extracted folder.

## Requirements

- `pip` should be installed and available in the terminal to download and install Python packages.
- `unzip` should be installed to extract the contents of `.zip` files.

## Example Workflow

1. **Download a Package:**
    ```bash
    ./pip-tool.sh -d requests
    ```
    This creates a `pip-package-requests.zip` file.

2. **Install from the Zip:**
    ```bash
    ./pip-tool.sh -i pip-package-requests.zip
    ```
    The `requests` package is installed from the `.zip` file.

## Troubleshooting

- If you encounter errors with `pip` or `unzip`, ensure they are installed and correctly configured on your system.
- The `.zip` file must contain a `.whl` file for installation to work. If no `.whl` file is found, the script will show an error.
