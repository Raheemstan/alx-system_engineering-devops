#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_while - Function to run an infinite loop
 * Return: Always 0
 */
int infinite_while(void)
{
    while (1)
    {
        sleep(1);
    }
    return (0);
}

/**
 * main - Creates 5 zombie processes
 * Return: Always 0
 */
int main(void)
{
    pid_t zombie_pid;
    int i;

    for (i = 0; i < 5; i++)
    {
        zombie_pid = fork();

        if (zombie_pid == 0) // Child process
            exit(0);
        else if (zombie_pid > 0) // Parent process
            printf("Zombie process created, PID: %d\n", zombie_pid);
        else // fork failed
        {
            perror("fork");
            return (1);
        }
    }

    infinite_while(); // Run an infinite loop to keep the program running
    return (0);
}
