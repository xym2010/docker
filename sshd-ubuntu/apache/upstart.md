sudo docker run --name server2 -p 10222:22 -p 10280:80 -v /data/share/server2/:/root/data -idt sshd:ubuntu /run.sh
