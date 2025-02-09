# Exercise 4 - Using pipelines and redirects

You will learn to:

- Use the output of one program as the input of another program
- Redirecting output from standard out to a file

:book: The pipeline is an important concept in Bash. Using pipes, we can take the standard output of one program and pass it as standard input to another program.

## 4.1 - Piping simple commands

The vertical line symbol `|` is a bash command for the pipe. You write it as a connector between any two commands to pass output of the first command as an input to the second command. For example:

```bash
ls -l | head -3
```

This example executes 2 commands. `ls -l` which lists out the content of our current directory in a readable format.
Example from the `./files` folder:

```bash
$ ls -l
total 48
-rw-r--r--  1 user  staff    26 Aug 18 16:33 config.yaml
-rw-r--r--  1 user  staff    33 Aug 18 16:33 data.json
-rw-r--r--  1 user  staff   445 Aug 18 16:33 file1.txt
-rw-r--r--  1 user  staff   865 Aug 18 16:33 file2.txt
-rw-r--r--  1 user  staff  1001 Aug 22 20:58 got_characters.txt
-rw-r--r--  1 user  staff    43 Aug 18 16:33 startup.yaml
```

The `tail -3` takes some input and returns the 3 last lines on the input. Combining the two commands should give us the following result:

```bash
-rw-r--r--  1 user  staff   865 Aug 18 16:33 file2.txt
-rw-r--r--  1 user  staff  1001 Aug 22 20:58 got_characters.txt
-rw-r--r--  1 user  staff    43 Aug 18 16:33 startup.yaml
```

:pencil2: Try piping the output into other commands, such as `wc -l` (counts the number of lines) or `grep <searchterm>` (text search).

## 4.2 - More pipes

You can combine several commands with pipes. For example, to take the first 5 rows of the `ls -l` command and then take the last two of these six, you could use `ls -l | head -5 | tail -2`

:pencil2: Try it out: `ls -l | head -5 | tail -2`

:pencil2: Using `cat`, list out the content of the file `/files/got_characters.txt`. You should get a list of Game of Thrones characters in your terminal.

:pencil2: Combine your `cat` of the file with the sort `sort` command, in order to output a sorted list of GoT characters.

:book: Oh oh... when we inspect our sorted list of GoT characters, we see that we have some duplicates. E.g. `Margaery Tyrell` and `Tywin Lannister` is showing up more than once.

:pencil2: Pipe the output of your sorted list of characters into the `uniq` command to remove any duplicates.

:pencil2: Using the `wc -l` command, find our how many unique GoT characters are in the `got_characters.txt` file.

## 4.3 - Redirect to file

:book: One of the things we can do in bash, is to redirect the output of a command to a file.
We can redirect to a file using the `>` or `>>` operator.

- The `>` operator will redirect the commands output to the file and remove any content that was already present.
- The `>>` operator will redirect the commands output to the file and append it to any existing content.

:pencil2: Using the `>` operator, create a new file named `unique_got_characters.txt` consisting of unique and sorted Game of Thrones characters.

### [Go to exercise 5 :arrow_right:](./exercise-5.md)
