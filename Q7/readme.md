# Question 7

## Command 1
```bash
sed -i 's/\r$//' patterns.sh
chmod +x patterns.sh
```
I converted the script to Unix format and updated file permissions so it could be executed correctly in the Linux environment.
Screenshot: screenshots/setup.png

## Command 2
```bash
./patterns.sh 2>&1 | tee ../outputs/q7_run.txt
```
I executed the script to classify words based on vowel and consonant patterns using case-insensitive regular expressions. The script correctly generated separate files for vowel-only, consonant-only, and mixed words starting with a consonant.
Output: outputs/q7_run.txt

## Command 3
```bash
cp vowels.txt consonants.txt mixed.txt ../outputs/
ls -l vowels.txt consonants.txt mixed.txt ../outputs/
```
I copied the generated output files to the outputs directory for grading visibility and verified that each pattern file was created successfully.