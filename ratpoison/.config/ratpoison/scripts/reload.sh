#!/bin/sh

# Reload ratpoisonrc without losing workspace layouts.

rpws dump /tmp/rpws.temp
ratpoison -c restart
rpws restore /tmp/rpws.temp
