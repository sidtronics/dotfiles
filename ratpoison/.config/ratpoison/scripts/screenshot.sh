#!/bin/sh

# Script for taking a screenshot.
# $1 is path to store screenshot at.

scrot $1/%Y-%m-%d-%H.%M.%S-screenshot.png
notify-send -u low -t 3000 Screenshot "saved at $1."
