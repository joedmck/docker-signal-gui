#!/usr/bin/env sh

set -ex

export HOME=/config
exec signal-desktop --no-sandbox
