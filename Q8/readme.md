# Question 8

## Command 1
```bash
sed -i 's/\r$//' bg_move.sh
chmod +x bg_move.sh
```
I converted the script to Unix format and updated permissions so it could be executed correctly in the Linux environment.
Screenshot: screenshots/setup.jpg

## Command 2
```bash
./bg_move.sh testdir 2>&1 | tee ../outputs/q8_run.txt
```
I executed the script to move files into a backup directory using background processes. Each move ran asynchronously, printed its PID, and the script waited for all background jobs to complete.
Output: outputs/q8_run.txt

## Command 3
```bash
ls testdir
ls testdir/backup
```
I verified that all files were successfully moved into the backup directory and that the original directory contained only the backup folder.
