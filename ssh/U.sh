#! /bin/sh
# wykonac jako uzytkownik U na maszynie klienckiej

ssh-keygen -t rsa
ssh-copy-id -p 31337 -i ~/.ssh/id_rsa U@localhost

scp -P 31337 ./sshd_config U@localhost:~
