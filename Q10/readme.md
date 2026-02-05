# Question 10

## Command 1
```bash
gcc signal_handling.c -o signal_handling
```
I compiled the C program that installs signal handlers in the parent process using `sigaction()` and creates child processes to send SIGTERM and SIGINT after specific delays.

## Command 2
```bash
./signal_handling 2>&1 | tee ../outputs/q10_run.txt
```
I executed the program and observed that the parent handled SIGTERM and SIGINT differently by printing distinct messages and performing separate cleanup actions. After both signals were handled, the parent exited gracefully and reaped child processes.
Output: outputs/q10_run.txt
