#!/bin/bash
service nginx start
service supervisor start
/usr/sbin/sshd -D
