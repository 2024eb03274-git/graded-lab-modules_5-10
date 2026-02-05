# Question 6

## Command 1
```bash
sed -i 's/\r$//' metrics.sh
chmod +x metrics.sh
```
I converted the script to Unix format and updated file permissions so it could be executed correctly in the Linux environment.

## Command 2
```bash
./metrics.sh 2>&1 | tee ../outputs/q6_results.txt
```
I executed the script to compute text metrics including longest word, shortest word, average word length, and the number of unique words using piped text-processing commands. The output correctly summarized the contents of the input file.
Output: outputs/q6_results.txt

