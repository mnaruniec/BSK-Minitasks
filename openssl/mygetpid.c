#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

pid_t getpid() {
        int result =  atoi(getenv("target_pid"));
        //printf("getpid(): %d\n", result);
        return result;
}
