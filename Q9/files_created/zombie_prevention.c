#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void)
{
    const int N = 5; // number of children
    pid_t pid;

    printf("Parent PID: %d\n", getpid());

    // Create multiple child processes
    for (int i = 0; i < N; i++)
    {
        pid = fork();

        if (pid < 0)
        {
            perror("fork failed");
            exit(1);
        }

        if (pid == 0)
        {
            // Child process: do a tiny bit of work, then exit
            printf("Child %d started. PID=%d, Parent=%d\n", i + 1, getpid(), getppid());
            sleep(1 + (i % 2)); // stagger exits a little
            printf("Child %d exiting. PID=%d\n", i + 1, getpid());
            exit(0);
        }
        // Parent continues loop to create next child
    }

    // Parent: prevent zombies by reaping all terminated children
    int status;
    pid_t ended;

    while ((ended = waitpid(-1, &status, 0)) > 0)
    {
        printf("Parent cleaned up child PID=%d", ended);

        if (WIFEXITED(status))
        {
            printf(" (exit status=%d)\n", WEXITSTATUS(status));
        }
        else if (WIFSIGNALED(status))
        {
            printf(" (killed by signal=%d)\n", WTERMSIG(status));
        }
        else
        {
            printf(" (ended for other reason)\n");
        }
    }

    printf("All child processes cleaned up. No zombies remain.\n");
    return 0;
}
