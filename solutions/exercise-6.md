# Solutions - Exercise 6

## 6.2 - Redirecting output streams

Redirect only stderr to errors.txt:
```bash
ls files/ nonexistent_file 2> errors.txt
```

View the error file:
```bash
cat errors.txt
```

Redirect both stdout and stderr to all_output.txt:
```bash
ls files/ nonexistent_file &> all_output.txt
# or
ls files/ nonexistent_file > all_output.txt 2>&1
```

Bonus - redirect stderr and stdout to different files:
```bash
ls files/ nonexistent_file > files_list.txt 2> errors.txt
```

---

## 6.3 - Input redirection

Count lines using input redirection:
```bash
wc -l < files/file1.txt
```

Sort using input redirection:
```bash
sort < files/got_characters.txt
```

Combine input and output redirection:
```bash
sort < files/got_characters.txt > sorted_characters.txt
```

---

## 6.4 - Finding text with grep

Search for "Stark":
```bash
grep "Stark" files/got_characters.txt
```

Case-insensitive search for "stark":
```bash
grep -i "stark" files/got_characters.txt
```

Count lines with "Lannister":
```bash
grep -c "Lannister" files/got_characters.txt
```

Find names without letter "a":
```bash
grep -v "a" files/got_characters.txt
```

Show line numbers for "Stark":
```bash
grep -n "Stark" files/got_characters.txt
```

---

## 6.5 - Grep with patterns

Find lines containing "ERROR":
```bash
grep "ERROR" files/logs.txt
```

Find lines starting with "2024-02-08 10:17":
```bash
grep "^2024-02-08 10:17" files/logs.txt
```

Find lines ending with "memory" (case-insensitive):
```bash
grep -i "memory$" files/logs.txt
```

Redirect ERROR lines to a file:
```bash
grep "ERROR" files/logs.txt > errors_only.txt
```

Count ERROR lines:
```bash
grep -c "ERROR" files/logs.txt
```

---

## 6.6 - Combining grep with pipes

List only .txt files:
```bash
ls files/ | grep "\.txt"
```

Count Stark family members:
```bash
cat files/got_characters.txt | grep "Stark" | wc -l
# or more efficiently:
grep "Stark" files/got_characters.txt | wc -l
```

Find WARNING and ERROR lines:
```bash
grep "WARNING\|ERROR" files/logs.txt > warnings_and_errors.txt
# or
grep "WARNING" files/logs.txt > warnings_and_errors.txt
grep "ERROR" files/logs.txt >> warnings_and_errors.txt
# or using grep twice:
cat files/logs.txt | grep -E "WARNING|ERROR" > warnings_and_errors.txt
```

---

## 6.7 - Recursive grep

Search recursively for "TODO":
```bash
grep -r "TODO" files/
```

Show only filenames:
```bash
grep -rl "TODO" files/
```

Case-insensitive search for "backup":
```bash
grep -ri "backup" files/
```

Bonus - count files containing "TODO":
```bash
grep -rl "TODO" files/ | wc -l
```

Bonus - find TODO with line numbers and save:
```bash
grep -rn "TODO" files/ > all_todos.txt
```
