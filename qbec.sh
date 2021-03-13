#!/usr/bin/env bash
set -euo pipefail

platform=$(uname)
if [ "$platform" == "Darwin" ]; then
    BINARY=$(rlocation helm_osx/qbec)
elif [ "$platform" == "Linux" ]; then
    BINARY=$(rlocation helm/qbec)
else
    echo "Helm does not have a binary for $platform"
    exit 1
fi

export QBEC_ROOT="$BUILD_WORKING_DIRECTORY"
export PATH="$(dirname $BINARY):$PATH"

cd "${BUILD_WORKING_DIRECTORY:-}"
qbec $*
