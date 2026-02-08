# Solutions - Exercise 9

## 9.2 - Substring extraction

Extract first name (assuming "John Smith"):

```bash
name="John Smith"
echo ${name:0:4}  # "John"
```

The complete `extract.sh`:

```bash
#!/bin/bash

text=$1

echo "Original text: $text"
echo "First 3 characters: ${text:0:3}"
echo "From position 5 to end: ${text:5}"
echo "Characters 2-5: ${text:2:3}"
```

Test with:
```bash
./extract.sh "Hello World"
```

---

## 9.3 - Removing prefixes and suffixes

### `remove_extension.sh`

```bash
#!/bin/bash

filename=$1
echo ${filename%.*}
```

Explanation:
- `%.*` removes the shortest match of `.` followed by anything from the end
- For `report.txt` → `report`
- For `backup.tar.gz` → `backup.tar` (only removes last extension)

To remove all extensions:
```bash
echo ${filename%%.*}
```
- `%%.*` removes the longest match
- For `backup.tar.gz` → `backup`

### `basename.sh`

```bash
#!/bin/bash

filepath=$1
echo ${filepath##*/}
```

Explanation:
- `##*/` removes the longest match of anything ending with `/` from the beginning
- For `/home/user/documents/report.txt` → `report.txt`

### `dirname.sh`

```bash
#!/bin/bash

filepath=$1
echo ${filepath%/*}
```

Explanation:
- `%/*` removes the shortest match of `/` followed by anything from the end
- For `/home/user/documents/report.txt` → `/home/user/documents`

---

## 9.4 - String replacement

Replace spaces with underscores:

```bash
sentence="Hello World from Bash"
echo ${sentence// /_}
# Output: Hello_World_from_Bash
```

The complete `replace.sh`:

```bash
#!/bin/bash

text=$1
find=$2
replace=$3

# Replace first occurrence
echo "Replace first: ${text/$find/$replace}"

# Replace all occurrences
echo "Replace all: ${text//$find/$replace}"
```

Test with:
```bash
./replace.sh "hello world hello" "hello" "hi"
```

---

## 9.5 - Practical exercises

### `path_info.sh`

```bash
#!/bin/bash

filepath=$1

echo "Full path: $filepath"
echo "Directory: ${filepath%/*}"
echo "Filename: ${filepath##*/}"

# Get filename without extension
filename="${filepath##*/}"
echo "Name: ${filename%.*}"

# Get extension
echo "Extension: ${filepath##*.}"
```

Test with:
```bash
./path_info.sh /home/user/documents/report.pdf
```

### `convert_filename.sh`

```bash
#!/bin/bash

filename=$1

# Replace spaces with hyphens
filename=${filename// /-}

# Convert to lowercase
filename=$(echo "$filename" | tr '[:upper:]' '[:lower:]')

echo "$filename"
```

Alternative (bash 4+):
```bash
#!/bin/bash

filename=$1
filename=${filename// /-}
filename=${filename,,}  # Lowercase conversion (bash 4+)
echo "$filename"
```

Test with:
```bash
./convert_filename.sh "My Summer Vacation 2024.txt"
```

---

## Bonus solutions

### `path_info.sh` handling multiple dots

```bash
#!/bin/bash

filepath=$1
filename="${filepath##*/}"
dirname="${filepath%/*}"

echo "Full path: $filepath"
echo "Directory: $dirname"
echo "Filename: $filename"

# For files like archive.tar.gz, remove only last extension
echo "Name (single ext): ${filename%.*}"

# Remove all extensions
echo "Name (all ext): ${filename%%.*}"

# Get last extension
echo "Extension: ${filepath##*.}"

# Get all extensions
basename="${filename%%.*}"
extensions="${filename#$basename}"
echo "All extensions: $extensions"
```

### Extension validator

```bash
#!/bin/bash

filename=$1
required_ext=$2

ext="${filename##*.}"

if [ "$ext" = "$required_ext" ]; then
  echo "Valid: File has .$required_ext extension"
  exit 0
else
  echo "Invalid: File does not have .$required_ext extension"
  exit 1
fi
```

Test with:
```bash
./validate_ext.sh report.pdf pdf  # Success
./validate_ext.sh report.txt pdf  # Failure
```

---

## String manipulation reference

### Substring extraction
- `${var:position}` - From position to end
- `${var:position:length}` - Substring with length
- `${var: -5}` - Last 5 characters (note the space before minus)

### Remove from beginning
- `${var#pattern}` - Remove shortest match from beginning
- `${var##pattern}` - Remove longest match from beginning

### Remove from end
- `${var%pattern}` - Remove shortest match from end
- `${var%%pattern}` - Remove longest match from end

### Replace
- `${var/pattern/string}` - Replace first match
- `${var//pattern/string}` - Replace all matches
- `${var/#pattern/string}` - Replace if at beginning
- `${var/%pattern/string}` - Replace if at end

### Case conversion (bash 4+)
- `${var^}` - Uppercase first character
- `${var^^}` - Uppercase all
- `${var,}` - Lowercase first character
- `${var,,}` - Lowercase all

### Length
- `${#var}` - Length of string
