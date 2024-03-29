#!/bin/sh

rpws dump /tmp/rpws.temp
ratpoison -c restart
rpws restore /tmp/rpws.temp
rm /tmp/rpws.temp
