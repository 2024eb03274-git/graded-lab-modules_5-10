# Question 4

## Command 1
```bash
sed -i 's/\r$//' emailcleaner.sh
chmod +x emailcleaner.sh
```
I converted the script to Unix format and made it executable so it can run correctly in the Linux environment.

## Command 2
```bash
./emailcleaner.sh 2>&1 | tee ../outputs/q4_run.txt
```
I executed the script to separate valid and invalid email addresses using a strict regex format and redirected results into output files. The script also removed duplicate valid emails using sort and uniq.
Output: outputs/q4_run.txt

## Command 3
```bash
cp valid.txt invalid.txt ../outputs/
ls -l valid.txt invalid.txt ../outputs/valid.txt ../outputs/invalid.txt
```
I copied the generated `valid.txt` and `invalid.txt` files to the outputs folder for grading visibility and verified they were created successfully.