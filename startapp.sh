#!/usr/bin/env sh

set -ex

export HOME=/config
exec session-desktop --no-sandbox
