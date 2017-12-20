#! /bin/sh
# wykonac jako guest na maszynie klienckiej

ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub mn360386@students.mimuw.edu.pl

cp ./config ~/.ssh/config

rsync -r students:/home/students/inf/PUBLIC/BSK ~/Desktop/copied

mkdir ~/Desktop/mounted
sshfs students:/home/students/inf/PUBLIC/BSK ~/Desktop/mounted

gpg --gen-key
gpg --output scripts.tar.gz.sig --sign scripts.tar.gz
gpg --export --armor > pub_key.txt
