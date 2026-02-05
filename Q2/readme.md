# Question 2

## Command 1
```bash
sed -i 's/\r$//' log_analyze.sh
chmod +x log_analyze.sh
```
I converted the script to Unix format and made it executable so it can be executed correctly in the Linux environment.

## Command 2
```bash
mkdir -p ../outputs
./log_analyze.sh sample.log 2>&1 | tee ../outputs/log_test.txt
```
I created the outputs directory and executed the script on a valid log file to count log levels and display the most recent ERROR message. The output correctly summarized the log contents and generated a dated report file.

## Command 3
```bash
./log_analyze.sh 2>&1 | tee ../outputs/error_test.txt
```
I ran the script without providing a log file argument to verify argument validation. The script correctly displayed a meaningful usage error message.

## Command 4
```bash
./log_analyze.sh missing.log 2>&1 | tee ../outputs/missing_test.txt
```
I tested the script using a non-existent log file to validate file existence and readability checks. The script correctly reported that the file was not accessible.

## Command 5
```bash
ls logsummary_*.txt
```
I listed the generated report file to confirm that the script created the expected `logsummary_<date>.txt` output successfully.