#! /bin/sh

for i in {1..32768}
do
    echo "checking pid $i"
    
    rm -f ~/.rnd
    export target_pid=$i
    
    # private key
    LD_PRELOAD=./mygetpid.so LD_LIBRARY_PATH=./openssl-1.1.0g/ ./openssl-1.1.0g/apps/openssl genrsa -out mypriv.pem 2048
    
    # public key
    LD_PRELOAD=./mygetpid.so LD_LIBRARY_PATH=./openssl-1.1.0g/ ./openssl-1.1.0g/apps/openssl rsa -in ./mypriv.pem -pubout -out mypublic.pem
    
    if ! diff -q mypublic.pem public.pem &>/dev/null
    then 
        echo "different"
    else
        echo "found match for pid $i"
        break
    fi

done
