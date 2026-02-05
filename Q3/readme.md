# Question 3

## Command 1
```bash
sed -i 's/\r$//' validate_results.sh
chmod +x validate_results.sh
```
I converted the script to Unix format and made it executable so it can run correctly in the Linux terminal environment.

## Command 2
```bash
./validate_results.sh 2>&1 | tee ../outputs/q3_results.txt
```
I executed the script to classify students based on pass/fail status (pass mark 33) and to count each category. The output correctly listed students who failed exactly one subject, those who passed all subjects, and the final counts.

Output: outputs/q3_results.txt 