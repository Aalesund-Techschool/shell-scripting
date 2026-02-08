# Shell scripting

The CLI (Command-line interface) is a developer's friend and power tool. Learn some of the most
important commands and see how the CLI can supercharge your workday.

You'll learn some basic bash programming and produce a simple deployment script for a remote location.

This repository contains a link to a Google Presentation with a quick introduction to the CLI,
some tips on useful tools and exercises. Happy hacking!

[Slides from the workshop presentation 2026-02-10](https://docs.google.com/presentation/d/13wFrnPyK8kr743sMfd65OKXrcjqkikjsELIkgVisDWM/edit?usp=sharing)

## What you need

You'll only need the Bash shell:

- Linux: Bash is already included
- MacOS: zch is now the default shell in the terminal and version 3.2 of bash is included. If you are familiar with homebrew, you can update bash, but we believe that all tasks can also be solved with zsh or bash 3.2.
- Windows: Install [Git for Windows](https://git-scm.com/download/win) - Remember to opt in for Git Bash when installing

## How to get started

- Start by cloning this repository into a folder on your computer. If you've never used git before, you can alternatively use the the green "Code" button to the top right, and then select "Download zip". Unzip the downloaded zip file (make sure to remember where you put it).
- Although you have this `README.md` file on your computer, it's easier to read it on GitHub with formatting. We therefore recommend you keep a web browser tab open with the exercise tasks.
- Start by opening [exercise 1](./exercises/exercise-1.md/).
- Remember to ask an instructor if you're stuck.

## Exercises

- [Exercise 1](./exercises/exercise-1.md/) - Getting started
- [Exercise 2](./exercises/exercise-2.md/) - Basics of the shell
- [Exercise 3](./exercises/exercise-3.md/) - Scripting
- [Exercise 4](./exercises/exercise-4.md/) - Using pipelines and redirects
- [Exercise 5](./exercises/exercise-5.md/) - Number guessing game
- [Bonus exercise](./exercises/exercise-bonus.md/) - Bonus exercise(s)

## Solutions

If you get stuck or need hints, you can find the solutions in the [solutions](./solutions/) folder.

## Symbols and icons you will see in the exercises

### Icons with special meaning

- :pencil2: An exercise you need to complete
- :bulb: Extra information or tips. You don't need to do anything, but take the information with you.
- :poop: Bad practice, often an unfortunate way to solve a problem.
- :star: A bonus exercise

### Keyboard shortcuts

Tips on keyboard shortcuts look like this:
<kbd>CTRL</kbd> + <kbd>ALT</kbd> + <kbd>C</kbd>

### Diff blocks

A diff-block will show if there is text that should be added or removed (- removed, + added)

```diff
- this text was removed
+ and replaced with this text
```

## Helpful resources

See command line [cheat sheet](https://upload.wikimedia.org/wikipedia/commons/b/b7/POSIX_Utilities.pdf).

### 1. Navigation commands

- `ls`: what's in this directory? ("list")
- `pwd` : where am I standing in the file system? ("print working directory")
- `cd` : take me to indicated directory ("change directory")
- `find` : find a file from given directory in the file tree

### 2. Getting an overview

- `history` : show me the commands I've run
- `tail` : read me the last lines of a file
- `head` : read me the first lines of a file
- `less` : non-editable view of a file
- `cat` : list contents of a file to standard out
- `grep` : search for a string of characters in a file using given regular expression

### 3. Files and directories

- `mkdir` : make a directory ("make dir")
- `cp` : copy a file or directory ("copy")
- `mv` : move a file or directory ("move")
- `rm` : delete a file or directory ("remove")
- `chmod` : change file permissions ("change mode")
- `touch` : change last-modified timestamp of a file without editing it

### 4. Scripting basics

- `echo` : print to screen (think `System.out.println`)
- `|` : send the output (pipe the output) to the next command
- `>` and `<` : redirecting input and output streams
- `for` - loop through a list of items
- `if` - conditional statements
- `var=value` - assign a value to a variable

### 5. How do I get help?

- Ask the instructors
- Ask an AI-assistant like ChatGPT. For example ["How do I list all .txt files with bash?"](https://chatgpt.com/share/67a20af4-f21c-800b-943e-609418eee6cf). Note: for maximum learning don't ask AI agents to give you answers directly. Instead, say something like "I'm learning Unix command line. Please, give me hints, but not answers." Then ask your question.
- Google is, as always, your friend
- Commands typically have the `-h` or `--help` flag to show help. For example `ls --help` will show you the help for the `ls` command.
- See the [cheat sheet](https://upload.wikimedia.org/wikipedia/commons/b/b7/POSIX_Utilities.pdf).
- `man <command>` - run the `man` command to get help for a command. For example `man ls` will show you the help for the `ls` command.
