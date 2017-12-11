#!/bin/bash

while ! nc -z localhost 1234; do echo "Waiting for gdb server"; sleep 1; done

# Customizing detach-keys is handy so CTRL-P/N work normally
docker run -v $PWD:/opt/littleosbook -it --detach-keys="ctrl-u,u" bellkev/littleosbook-mac gdb -x script/gdb-init
