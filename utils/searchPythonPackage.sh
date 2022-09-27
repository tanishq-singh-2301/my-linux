# Find dir of python3 packages
function searchPythonPackages() {
    to_find=$1
    type=$2
    python_version=$(python3 --version)
    declare -a packages=($(find / ! \( -path /mnt -prune \) -type $type 2>/dev/null | grep $to_find))

    for package in ${packages[@]}; do
        if [[ "$package" == *"${python_version:7:3}"* ]] || [[ "$package" == *"python"* ]] || [[ "$package" == *"Python"* ]]; then
            echo "$package"
        fi
    done
}
