#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

volatile sig_atomic_t got_sigterm = 0;
volatile sig_atomic_t got_sigint = 0;

void handle_sigterm(int sig)
{
    (void)sig;
    got_sigterm = 1;
}

void handle_sigint(int sig)
{
    (void)sig;
    got_sigint = 1;
}

int main(void)
{
    printf("Parent PID: %d\n", getpid());
    printf("Parent will run indefinitely until it receives signals.\n");

    // Install signal handlers using sigaction
    struct sigaction sa_term;
    sa_term.sa_handler = handle_sigterm;
    sigemptyset(&sa_term.sa_mask);
    sa_term.sa_flags = 0;

    struct sigaction sa_int;
    sa_int.sa_handler = handle_sigint;
    sigemptyset(&sa_int.sa_mask);
    sa_int.sa_flags = 0;

    if (sigaction(SIGTERM, &sa_term, NULL) == -1)
    {
        perror("sigaction(SIGTERM) failed");
        return 1;
    }
    if (sigaction(SIGINT, &sa_int, NULL) == -1)
    {
        perror("sigaction(SIGINT) failed");
        return 1;
    }

    // Child 1: send SIGTERM after 5 seconds
    pid_t c1 = fork();
    if (c1 < 0)
    {
        perror("fork failed");
        return 1;
    }
    if (c1 == 0)
    {
        sleep(5);
        printf("Child 1 sending SIGTERM to parent (%d)\n", getppid());
        kill(getppid(), SIGTERM);
        exit(0);
    }

    // Child 2: send SIGINT after 10 seconds
    pid_t c2 = fork();
    if (c2 < 0)
    {
        perror("fork failed");
        return 1;
    }
    if (c2 == 0)
    {
        sleep(10);
        printf("Child 2 sending SIGINT to parent (%d)\n", getppid());
        kill(getppid(), SIGINT);
        exit(0);
    }

    // Parent "runs indefinitely"
    // We will exit gracefully after receiving BOTH signals.
    int signals_handled = 0;

	while (signals_handled < 2)
	{
		pause(); // wait for signal

		if (got_sigterm)
		{
			printf("Parent handled SIGTERM: performing cleanup task A...\n");
			got_sigterm = 0;
			signals_handled++;
		}

		if (got_sigint)
		{
			printf("Parent handled SIGINT: performing cleanup task B...\n");
			got_sigint = 0;
			signals_handled++;
		}
	}

printf("Parent exiting gracefully after handling all signals.\n");

    return 0;
}
