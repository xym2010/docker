#!/bin/bash
service apache2 start
service supervisor start
/usr/sbin/sshd -D
