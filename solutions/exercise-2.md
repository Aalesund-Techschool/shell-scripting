# Solutions - Exercise 2

## 2.1
### 2.2.2
*List the contents of the directory you are currently standing in*

This is done using the `ls` command. You can also pass parameters, in order to e.g. get a list with size, last modified date etc with the `-l` parameters. With the `-a` parameter.
```
ls -la
```

## 2.3
*Print the path to the current working directory*

Use the `pwd` command (Print working directory)

*Print the current date and time*
```bash
date
```

*Print the date and time in the following format: yyyy-mm-dd hh:mm:ss*
```bash
date +"%Y-%m-%d %H:%M:%S"
```

*List the hidden files (if any) in a directory (hint: in unix, hidden files starts with dot (".ssh"))*

```bash
ls -a 
# or
ls -la
```

*Navigate to the `files` subdirectory, if you are inside the root folder of the GIT*
```bash
cd files
```

*List all `txt` files in a the `files` directory with human-readable size references (e.g. Megabytes) ordered by the last-modified date*  

```bash
# Lists the files in the current directory
ls

# Lists the files, long format
ls -l 

# Lists all files with .txt extension in the current directory
ls *.txt

# When used with the -l option, use human-readable units for file sizes
-h

# Sort by last modified date 
-t 

# Complete command
ls -lht *.txt

# If you want to reverse the order, add the -r flag
ls -lhtr *.txt
```

*Navigate back to the root-directory of the GIT workshop directory.*
```bash
cd ..
```


*Find the location of your `git` executable.*

`which git` will show you the location of your git executable.

*Listen to the tail end of the file `file1.txt` in the `files` folder. Try adding new content to the file* 
```
tail -f file1.txt
```
*How do you exit from the live view of the file?* 
Use `ctrl` + `c` to exit.

## 2.4

*List the contents of your PATH variable*
```
echo $PATH
```

*Create a new directory and add this directory to your PATH variable. Verify that it was added by repeating the previous step.*

```
mkdir myfolder
export PATH=$PATH:/path/to/myfolder
echo $PATH
```

## 2.6
To clear the command history: `history -c`