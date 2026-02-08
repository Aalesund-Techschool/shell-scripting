# Exercise 6 - Redirects and grep

You will learn to:

- Redirect standard error (stderr) to a file
- Redirect both stdout and stderr
- Use input redirection
- Find text in files using grep with various options
- Use grep recursively across directories

## Required software and tools for this exercise

- Bash
- A terminal

---

## 6.1 - Understanding output streams

:book: In Exercise 4 you learned about `>` and `>>` to redirect output to a file. But there's more to the story. Every command can output to two different streams:

- **stdout (standard output)** - The normal output from a command. This is stream number **1**.
- **stderr (standard error)** - Error messages and warnings. This is stream number **2**.

:book: By default, both stdout and stderr appear in your terminal. But you can redirect them separately!

:book: When you use `>` without a number, it's the same as `1>` - it redirects stdout only.

---

## 6.2 - Redirecting output streams

:book: To redirect stderr, use `2>`:

```bash
ls nonexistent_file 2> errors.txt
```

:book: To redirect both stdout and stderr to the same file:

```bash
command > output.txt 2>&1
# or the shorter form:
command &> output.txt
```

:book: The `2>&1` syntax means "redirect stderr (2) to wherever stdout (1) is going".

:pencil2: Run `ls files/ nonexistent_file` and observe the output. You should see both the file list (stdout) and an error message (stderr).

:pencil2: Run the same command but redirect only stderr to a file called `errors.txt` using `2>`. You should see the file list on screen, but the error goes to the file.

:pencil2: Use `cat errors.txt` to verify the error was captured.

:pencil2: Run the command again but redirect both stdout and stderr to a file called `all_output.txt` using `&>`.

:pencil2: Verify the file contains both the file list and the error message.

:star: Bonus: Redirect stderr to `errors.txt` and stdout to `files_list.txt` in a single command. :bulb: Hint: You can use both `>` and `2>` in the same command.

---

## 6.3 - Input redirection

:book: You can redirect file content as input to a command using `<`:

```bash
wc -l < files/got_characters.txt
```

:book: This is different from `wc -l files/got_characters.txt` - with `<` the command receives the file content as input without knowing the filename.

:pencil2: Count the lines in `files/file1.txt` using input redirection with `<`.

:pencil2: Sort the contents of `files/got_characters.txt` using `sort < files/got_characters.txt`.

:pencil2: Combine input and output redirection: sort `files/got_characters.txt` and save the result to `sorted_characters.txt` using both `<` and `>`.

---

## 6.4 - Finding text with grep

:book: `grep` searches for patterns in files. It's one of the most powerful text processing tools in Unix.

:book: Basic syntax: `grep pattern filename`

:book: Useful grep options:

- `-i` - Case-insensitive search
- `-n` - Show line numbers
- `-c` - Count matches (just show the number)
- `-v` - Invert match (show lines that DON'T match)
- `-r` - Recursive search in directories
- `-l` - Show only filenames with matches (not the matching lines)

:pencil2: Search for "Stark" in `files/got_characters.txt`:

```bash
grep "Stark" files/got_characters.txt
```

:pencil2: Search for "stark" (lowercase) using case-insensitive search with the `-i` option.

:pencil2: Count how many lines contain "Lannister" using the `-c` option.

:pencil2: Find all characters whose names do NOT contain the letter "a" using the `-v` option.

:pencil2: Search for "Stark" and show line numbers using the `-n` option.

---

## 6.5 - Grep with patterns

:book: Grep supports basic patterns that make your searches more powerful:

- `.` - Any single character
- `^` - Start of line
- `$` - End of line
- `[abc]` - Match any character in brackets

:pencil2: We have created a file `files/logs.txt` with log entries. Use `cat files/logs.txt` to view its contents.

:pencil2: Find all lines that contain "ERROR":

```bash
grep "ERROR" files/logs.txt
```

:pencil2: Find all lines that start with "2024-02-08 10:17" using the `^` pattern.

:bulb: Hint: `grep "^pattern" file` matches lines starting with "pattern".

:pencil2: Find all lines that end with "memory" (case-insensitive).

:bulb: Hint: Use both `-i` and the `$` pattern.

:pencil2: Redirect all ERROR lines to a new file `errors_only.txt` using grep with output redirection.

:pencil2: Count how many ERROR lines there are in the log file.

---

## 6.6 - Combining grep with pipes

:book: Grep is very powerful when combined with pipes. You can filter the output of any command.

:pencil2: List all files in the `files` directory and use grep to show only `.txt` files:

```bash
ls files/ | grep "\.txt"
```

:bulb: Notice the backslash `\` before the dot - this is needed because `.` has a special meaning in patterns.

:pencil2: Use `cat files/got_characters.txt | grep "Stark" | wc -l` to count how many Stark family members are in the file.

:pencil2: Find all WARNING and ERROR lines from the log file and save them to `warnings_and_errors.txt`.

:bulb: Hint: You can use grep twice in a pipeline, or use the pattern `WARNING\|ERROR` (the `\|` means "or").

---

## 6.7 - Recursive grep

:book: Use `-r` to search in all files within a directory and its subdirectories:

```bash
grep -r "pattern" directory/
```

:book: This is extremely useful when you need to find something in a large codebase but don't know which file contains it.

:pencil2: We have created some files in `files/subdir/`. From the root of the workshop directory, search recursively for "TODO" in all files under `files/`:

```bash
grep -r "TODO" files/
```

:question: How many files contain "TODO"?

:pencil2: Use the `-l` option to show only the filenames (not the matching lines):

```bash
grep -rl "TODO" files/
```

:pencil2: Search recursively for "backup" (case-insensitive) in the `files/` directory.

:star: Bonus: Combine grep with pipes - use `grep -rl "TODO" files/` and pipe the result to `wc -l` to count how many files contain "TODO".

:star: Bonus: Search for lines containing "TODO" in all files, show line numbers, and save the result to `all_todos.txt`.

---

## Summary

In this exercise you learned about stdout and stderr, how to redirect them separately, and how to use input redirection. You also learned how to use grep to search for text in files, use patterns, and search recursively through directories. These are essential skills for working with the command line and processing text.

### [Go to exercise 7 :arrow_right:](./exercise-7.md)
