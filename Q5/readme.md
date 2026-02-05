# Question 5

## Command 1
```bash
sed -i 's/\r$//' sync.sh
chmod +x sync.sh
```
I converted the script to Unix format and updated permissions so it could be executed correctly in the Linux environment.

## Command 2
```bash
./sync.sh dirA dirB 2>&1 | tee ../outputs/q5_results.txt
```
I executed the script to compare two directories by listing unique files and checking content equality for files with the same name using cmp. The script reported matching and differing files without copying or modifying any data.

Output: outputs/q5_results.txt