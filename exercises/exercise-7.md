# Exercise 7 - Case statements

You will learn to:

- Use case statements for multi-way branching
- Handle multiple patterns in case branches
- Combine case with user input

## Required software and tools for this exercise

- Bash
- A terminal
- Visual Studio Code (or any text editor)

---

## 7.1 - Introduction to case

:book: When you have many conditions to check, `case` statements are cleaner and more readable than multiple `if-elif-else` statements.

:book: Syntax:

```bash
case $variable in
  pattern1)
    # commands for pattern1
    ;;
  pattern2)
    # commands for pattern2
    ;;
  *)
    # default case (if nothing else matches)
    ;;
esac
```

:exclamation: Don't forget the `;;` after each case block! This tells bash where one case ends and the next begins.

:exclamation: Notice that `case` starts with `case` and ends with `esac` (case spelled backwards).

---

## 7.2 - Simple case example

:book: Let's start with a simple example. We'll create a script that responds differently depending on which day of the week you give it.

:pencil2: Create a file called `day_of_week.sh` in your workspace directory:

```bash
#!/bin/bash

day=$1

case $day in
  Monday)
    echo "Start of the work week"
    ;;
  Friday)
    echo "TGIF!"
    ;;
  Saturday|Sunday)
    echo "Weekend!"
    ;;
  *)
    echo "Just another day"
    ;;
esac
```

:book: Notice the `Saturday|Sunday` line - the `|` means "or", so this matches either Saturday or Sunday.

:book: The `*)` at the end is the default case - it matches anything that didn't match the previous patterns.

:pencil2: Set execute permissions: `chmod u+x day_of_week.sh`

:pencil2: Test the script with different days:

```bash
./day_of_week.sh Monday
./day_of_week.sh Friday
./day_of_week.sh Saturday
./day_of_week.sh Tuesday
```

:question: What happens when you run `./day_of_week.sh Saturday`?

:question: What happens if you run the script with no arguments?

---

## 7.3 - Case with pattern matching

:book: Case statements support wildcards for pattern matching:

- `*` - Matches any characters (zero or more)
- `?` - Matches exactly one character
- `[abc]` - Matches any single character in the brackets
- `[a-z]` - Matches any character in the range

:book: This is very useful for matching file extensions or patterns in filenames.

:pencil2: Create a script called `file_type.sh` that takes a filename as an argument and tells you what type of file it is based on its extension.

The script should:

- Check if the filename ends with `.txt` and print "Text file"
- Check if the filename ends with `.sh` and print "Shell script"
- Check if the filename ends with `.jpg`, `.png`, or `.gif` and print "Image file"
- For anything else, print "Unknown file type"

:bulb: Hint: Use the pattern `*.txt` to match any filename ending with `.txt`.

:bulb: Hint: Use `|` to match multiple extensions in one case, like `*.jpg|*.png|*.gif`.

:bulb: Hint: Your case statement should look like:

```bash
case $filename in
  *.txt)
    # your code here
    ;;
  # more cases here
esac
```

:pencil2: After creating the script, set execute permissions and test it with different filenames:

```bash
./file_type.sh report.txt
./file_type.sh backup.sh
./file_type.sh photo.jpg
./file_type.sh document.pdf
```

:star: Bonus: Add more file types like `.pdf`, `.zip`, `.mp3`, etc.

:star: Bonus: Add a check at the beginning to see if an argument was provided. If not, print a usage message like "Usage: ./file_type.sh <filename>".

---

## 7.4 - Case with user input

:book: Case statements are perfect for processing user choices, like in calculators or menu systems.

:pencil2: Create a script called `calculator.sh` that takes an operator and two numbers as arguments, then performs the calculation.

The script should accept the command line arguments in this order:

1. Operator (+, -, \*, /)
2. First number
3. Second number

:pencil2: Start by creating the script with this structure:

```bash
#!/bin/bash

op=$1
a=$2
b=$3

case $op in
  +)
    echo $((a + b))
    ;;
  # Add your cases for -, *, and / here
  *)
    echo "Unknown operator. Use +, -, *, or /"
    ;;
esac
```

:pencil2: Complete the script by adding cases for:

- `-` (subtraction)
- `*` (multiplication)

:exclamation: Note: When testing multiplication, you need to quote the `*` because the shell will try to expand it as a wildcard: `./calculator.sh "*" 5 3`

:pencil2: Test your calculator:

```bash
./calculator.sh + 5 3
./calculator.sh - 10 4
./calculator.sh "*" 6 7
```

:star: Bonus: Add division `/`. :bulb: Hint: Use the same arithmetic syntax `$((a / b))`.

:star: Bonus: Add a case for `%` (modulo/remainder) or `**` (power).

:star: Bonus: Come up with your own operation!

:star: Bonus: Add validation to check if exactly 3 arguments were provided. If not, print a usage message and exit.

---

## Summary

In this exercise you learned how to use case statements for multi-way branching, pattern matching with wildcards, and processing command-line arguments. Case statements are cleaner and more readable than long chains of if-elif statements, especially when you have many conditions to check.

### [Go to exercise 8 :arrow_right:](./exercise-8.md)
