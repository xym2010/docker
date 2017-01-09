sudo docker run --name server1 -p 10122:22 -p 10180:80 -v /data/share/server1/:/root/data -idt sshd:ubuntu /run.sh
