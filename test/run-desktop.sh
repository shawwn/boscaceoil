#!/bin/sh
dir="$(dirname "$0")"
set -x

sh "$dir/build-desktop.sh" || exit 1
exec open BoscaCeoil.app
