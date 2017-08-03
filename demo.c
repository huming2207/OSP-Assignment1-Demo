#define _GNU_SOURCE	// Shut up GCC's warning
#include <stdio.h>
#include <unistd.h>
//#include <sys/syscall.h>

int main()
{
    printf("[INFO] Testing OSP demo system call...\n");

    if(syscall(333) == 0) // In the kernel, 333 is my syscall, osp_syscall_hu();
    {
        printf("[INFO] Successful, check dmesg now!\n");
    }
    else
    {
        printf("[INFO] System call invoking process return unsuccessful result!\n");
    }

    return 0;
}
