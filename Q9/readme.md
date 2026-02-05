# Question 9

## Command 1
```bash
gcc zombie_prevention.c -o zombie_prevention
```
I compiled the C program that creates multiple child processes and uses waitpid() in the parent to reap terminated children and prevent zombie processes.

## Command 2
```bash
./zombie_prevention 2>&1 | tee ../outputs/q9_run.txt
```
I executed the program and observed that the parent process cleaned up each child by printing the PID returned by `waitpid()` . This confirms terminated child processes are reaped and do not remain as zombies.
Output: outputs/q9_run.txt
