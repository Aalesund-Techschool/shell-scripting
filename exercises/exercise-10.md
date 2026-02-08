# Exercise 10 - Stream editing with sed

You will learn to:

- Use sed for text substitution
- Work with sed patterns and regular expressions
- Apply sed to files and pipes
- Perform multiple substitutions

## Required software and tools for this exercise

- Bash
- A terminal
- The `sed` command (preinstalled on Unix-like systems)

---

## 10.1 - Introduction to sed

:book: `sed` stands for **Stream EDitor**. It's a powerful tool for transforming text. While sed can do many things, its most common use is finding and replacing text - either in files or in data flowing through pipes.

:book: Basic syntax: `sed 's/pattern/replacement/' file`

:exclamation: In this exercise, you'll learn by doing. We'll give you the tasks and mention relevant concepts, but you'll need to research the specific syntax yourself. This is how real developers work!

---

## 10.2 - Basic substitution

:book: The `s` command in sed means "substitute". The basic format is `s/old/new/`.

:pencil2: Use `cat` to view the contents of `files/file1.txt`.

:pencil2: Use sed to replace the word "dolor" with "DOLOR" in `files/file1.txt`. Display the result in the terminal (sed outputs to stdout by default).

:pencil2: Notice that sed only replaced the first occurrence on each line. Research how to replace ALL occurrences (hint: there's a flag you can add after the last `/`).

:pencil2: Try replacing "lorem" (any case) with "LOREM". Research the case-insensitive flag for sed.

:bulb: Hint: The general syntax is `sed 's/old/new/flags'` where flags can be `g` (global), `i` (case-insensitive), or combinations.

---

## 10.3 - Sed with pipes

:book: Sed is very powerful when combined with pipes. You can transform the output of any command.

:pencil2: Use `ls *.txt` to list text files, then pipe the output to sed to change all `.txt` extensions to `.backup`.

:pencil2: Use `echo` to print a date string like "2024-02-08", then use sed to convert it to the format "08/02/2024" (day/month/year).

:bulb: Hint: You can use `\(` and `\)` to capture groups in the pattern, then reference them with `\1`, `\2`, etc. Research "sed capture groups" or "sed backreferences".

---

## 10.4 - Sed with files

:book: While sed outputs to stdout by default, you can save the result to a new file using output redirection.

:pencil2: Create a new file from `files/file1.txt` called `file1_modified.txt` where you replace all occurrences of "dolor" with "DOLOR". Use sed with output redirection (`>`).

:pencil2: Create a file `files/emails.txt` with some text containing email addresses like `user@example.com`. Use sed to replace the domain `example.com` with `newdomain.com`.

:exclamation: To edit a file in-place (modify the actual file), you can use `sed -i`, but be careful - there's no undo! For learning purposes, always output to a new file instead.

---

## 10.5 - Multiple substitutions

:book: You can perform multiple substitutions in one sed command by separating them with semicolons `;` or by using multiple `-e` options.

:pencil2: Create a sed command that performs TWO substitutions on `files/file1.txt`:
1. Replace "dolor" with "DOLOR"
2. Replace "ipsum" with "IPSUM"

:bulb: Hint: `sed 's/old1/new1/; s/old2/new2/'` or `sed -e 's/old1/new1/' -e 's/old2/new2/'`

:pencil2: Create a script `clean_text.sh` that takes a filename as argument and performs multiple cleaning operations:
- Remove extra spaces (replace multiple spaces with single space)
- Remove leading spaces at the start of lines
- Remove trailing spaces at the end of lines

:bulb: Hint: Use `^` for start of line and `$` for end of line. Use ` *` or ` +` for multiple spaces.

---

## 10.6 - Practical exercises

:pencil2: Create a script `anonymize.sh` that takes a text file and replaces all email addresses with `[EMAIL REDACTED]`. Test it on a file containing several email addresses.

:bulb: Hint: You don't need a perfect email regex. A simple pattern like `[a-zA-Z0-9._-]*@[a-zA-Z0-9.-]*` can work for basic cases.

:pencil2: Create a script `convert_dates.sh` that converts dates from YYYY-MM-DD format to DD/MM/YYYY format in a text file.

:pencil2: Create a script `quote_remover.sh` that removes all quotation marks (both single `'` and double `"`) from a text file.

:star: Bonus: Create a script that reads a log file and extracts only lines containing "ERROR", then uses sed to highlight the word "ERROR" by surrounding it with asterisks: `***ERROR***`.

:star: Bonus: Research how to use sed to delete lines (the `d` command) and create a script that removes all empty lines from a file.

---

## Resources

:book: If you get stuck:
- Search for "sed tutorial" or "sed examples"
- Check `man sed` for the sed manual
- Look at the [sed one-liners](http://sed.sourceforge.net/sed1line.txt) for common patterns
- Peek at `solutions/exercise-10.md`

:bulb: Tip: Test your sed commands on small sample text first. Use `echo "test text" | sed 's/pattern/replacement/'` to quickly test patterns.

---

## Summary

In this exercise you learned how to use sed for text transformation. Sed is an essential tool for processing text files, transforming data in pipelines, and automating text editing tasks. Combined with other Unix tools, sed is a powerful part of your shell scripting toolkit.

### [:star: Go to Bonus exercises :arrow_right:](./bonus-1.md)
