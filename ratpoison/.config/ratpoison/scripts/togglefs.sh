#!/bin/sh

# Simple script to toggle fullscreen.

if [ "$(ratpoison -c "set padding")" = "0 22 0 0" ]; then
    ratpoison -c "set padding 0 0 0 0"
else
    ratpoison -c "set padding 0 22 0 0"
fi
