#!/bin/sh
# curl -fsSL https://raw.githubusercontent.com/njayman/samfetch/dev/install.sh | sh
set -eu

case "$(uname -s)-$(uname -m)" in
    Linux-x86_64) target=linux-amd64 ;;
    Linux-aarch64 | Linux-arm64) target=linux-arm64 ;;
    Darwin-*) target=macos-universal ;;
    *)
        echo "samfetch: no prebuilt binary for $(uname -s) $(uname -m), build from source (see README)" >&2
        exit 1
        ;;
esac

dir=${SAMFETCH_DIR:-$HOME/.local/bin}
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

curl -fsSL "https://github.com/njayman/samfetch/releases/latest/download/samfetch-$target.tar.gz" | tar xz -C "$tmp"
mkdir -p "$dir"
install -m 755 "$tmp/samfetch" "$dir/samfetch"
echo "samfetch installed to $dir/samfetch"

case ":$PATH:" in
    *":$dir:"*) ;;
    *) echo "note: $dir is not on your PATH, add it to run samfetch" ;;
esac
