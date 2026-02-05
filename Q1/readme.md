# Question 1

## Command 1
```bash
chmod +x analyze.sh
```
I used this command to make the shell script executable so it could be run from the terminal. The command completed successfully without errors.
**I converted the script from Windows to Unix format to fix the bad interpreter error caused by CRLF line endings. After conversion, I successfully made the script executable using chmod.

## Command 2
```bash
./analyze.sh sample.txt
```
I executed the script with a file as input to display the number of lines, words, and characters. The output correctly summarized the file contents.

## Command 3
```bash
./analyze.sh .
```
I ran the script on a directory to count the total number of files and the number of `.txt` files present. The output accurately reflected the directory contents.

## Command 4
```bash
./analyze.sh
```
I ran the script without arguments to test error handling. The script correctly displayed an error message indicating invalid usage.