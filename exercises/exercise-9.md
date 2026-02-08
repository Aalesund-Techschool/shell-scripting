# Exercise 9 - String manipulation

You will learn to:

- Extract substrings from variables
- Remove prefixes and suffixes from strings
- Replace text within strings
- Work with file paths and extensions

## Required software and tools for this exercise

- Bash
- A terminal
- Visual Studio Code (or any text editor)

---

## 9.1 - Introduction to string manipulation

:book: Bash has powerful built-in capabilities for manipulating strings. You can extract parts of strings, remove patterns, and replace text without needing external commands. This is very useful for processing filenames, paths, and user input.

:book: The syntax uses curly braces `${}` with special operators like `:`, `#`, `%`, and `//`.

:exclamation: In this exercise, you'll need to research and experiment with these bash string manipulation techniques. Use the resources mentioned at the end of this file, or search online for "bash string manipulation" or "bash parameter expansion".

---

## 9.2 - Substring extraction

:book: You can extract parts of a string using `${variable:start:length}` syntax.

:pencil2: Create a variable containing your full name. Extract and print just the first name (first 3-5 characters).

:pencil2: Create a script `extract.sh` that takes a string as an argument and prints:
- The first 3 characters
- Characters from position 5 to the end
- A substring of your choice

:bulb: Hint: Research `${var:offset}` and `${var:offset:length}` syntax.

---

## 9.3 - Removing prefixes and suffixes

:book: You can remove patterns from the beginning or end of strings:
- `#` removes from the beginning (shortest match)
- `##` removes from the beginning (longest match)
- `%` removes from the end (shortest match)
- `%%` removes from the end (longest match)

:pencil2: Create a script `remove_extension.sh` that takes a filename as argument (like `report.txt` or `backup.tar.gz`) and prints the filename without the extension.

:pencil2: Create a script `basename.sh` that takes a full file path as argument (like `/home/user/documents/report.txt`) and prints only the filename (without the directory path).

:pencil2: Create a script `dirname.sh` that does the opposite - takes a full path and prints only the directory path (without the filename).

:bulb: Hint: Use `*` as a wildcard in your patterns. Research `${var#pattern}`, `${var##pattern}`, `${var%pattern}`, and `${var%%pattern}`.

---

## 9.4 - String replacement

:book: You can replace text within strings:
- `${var/pattern/replacement}` - Replace first occurrence
- `${var//pattern/replacement}` - Replace all occurrences

:pencil2: Create a variable containing a sentence with spaces. Replace all spaces with underscores.

:pencil2: Create a script `replace.sh` that takes three arguments:
1. A text string
2. The text to find
3. The replacement text

The script should perform the replacement and print the result.

:pencil2: Experiment with replacing only the first occurrence vs. all occurrences.

---

## 9.5 - Practical exercises

:pencil2: Create a script `path_info.sh` that takes a file path as argument and displays:
- Full path
- Directory name (path without filename)
- Filename (with extension)
- Filename without extension
- Extension only

Example: For `/home/user/documents/report.pdf`, it should output:
```
Full path: /home/user/documents/report.pdf
Directory: /home/user/documents
Filename: report.pdf
Name: report
Extension: pdf
```

:bulb: Hint: Combine multiple string manipulation techniques. Think about what patterns to use with `#`, `##`, `%`, and `%%`.

:pencil2: Create a script `convert_filename.sh` that takes a filename with spaces and converts it to a "slug" format:
- Replace spaces with hyphens
- Convert to lowercase (research how to do this in bash)

Example: `"My Summer Vacation 2024.txt"` becomes `"my-summer-vacation-2024.txt"`

:star: Bonus: Make `path_info.sh` handle files with multiple dots in the name (like `archive.tar.gz`) correctly.

:star: Bonus: Create a script that validates if a filename has a specific extension (exits with success if it does, error if it doesn't).

---

## Resources

:book: If you get stuck, you can:
- Search for "bash parameter expansion"
- Search for "bash string manipulation cheat sheet"
- Look at the [Bash String Manipulation guide](https://tldp.org/LDP/abs/html/string-manipulation.html)
- Check the solution file in `solutions/exercise-9.md`

:bulb: Remember: Experimentation is key! Try things in your terminal, see what works, and learn from the errors.

---

## Summary

In this exercise you learned about bash's powerful string manipulation capabilities. These techniques are essential for processing filenames, paths, and text data in your scripts without needing external tools like `cut` or `awk`.

### [Go to exercise 10 :arrow_right:](./exercise-10.md)
