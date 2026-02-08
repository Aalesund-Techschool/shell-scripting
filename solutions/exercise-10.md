# Solutions - Exercise 10

## 10.2 - Basic substitution

View file contents:
```bash
cat files/file1.txt
```

Replace "dolor" with "DOLOR" (first occurrence per line):
```bash
sed 's/dolor/DOLOR/' files/file1.txt
```

Replace ALL occurrences (global flag `g`):
```bash
sed 's/dolor/DOLOR/g' files/file1.txt
```

Case-insensitive replacement (flag `i`):
```bash
sed 's/lorem/LOREM/gi' files/file1.txt
```

Combined flags:
```bash
sed 's/dolor/DOLOR/gi' files/file1.txt
```

---

## 10.3 - Sed with pipes

Change `.txt` to `.backup`:
```bash
ls *.txt | sed 's/\.txt$/.backup/'
```

Note: The `.` is escaped as `\.` because `.` means "any character" in regex. The `$` means "end of line".

Convert date format from YYYY-MM-DD to DD/MM/YYYY:
```bash
echo "2024-02-08" | sed 's/\([0-9]*\)-\([0-9]*\)-\([0-9]*\)/\3\/\2\/\1/'
```

Explanation:
- `\([0-9]*\)` - Capture group of digits
- `\1`, `\2`, `\3` - References to captured groups
- `\/` - Escaped forward slash

Simpler alternative for this specific case:
```bash
echo "2024-02-08" | sed 's/\(.*\)-\(.*\)-\(.*\)/\3\/\2\/\1/'
```

---

## 10.4 - Sed with files

Replace and save to new file:
```bash
sed 's/dolor/DOLOR/g' files/file1.txt > file1_modified.txt
```

Create emails.txt and replace domain:
```bash
echo "Contact john@example.com or jane@example.com" > files/emails.txt
sed 's/example\.com/newdomain.com/g' files/emails.txt
```

Save to new file:
```bash
sed 's/example\.com/newdomain.com/g' files/emails.txt > files/emails_updated.txt
```

---

## 10.5 - Multiple substitutions

Two substitutions with semicolon:
```bash
sed 's/dolor/DOLOR/g; s/ipsum/IPSUM/g' files/file1.txt
```

Or with multiple `-e` options:
```bash
sed -e 's/dolor/DOLOR/g' -e 's/ipsum/IPSUM/g' files/file1.txt
```

### `clean_text.sh`

```bash
#!/bin/bash

filename=$1

# Multiple cleaning operations
sed 's/  */ /g; s/^ *//; s/ *$//' "$filename"
```

Explanation:
- `s/  */ /g` - Replace multiple spaces with single space
- `s/^ *//` - Remove leading spaces (^ means start of line)
- `s/ *$//` - Remove trailing spaces ($ means end of line)

Alternative with multiple -e:
```bash
#!/bin/bash

filename=$1

sed -e 's/  */ /g' \
    -e 's/^ *//' \
    -e 's/ *$//' \
    "$filename"
```

Test with:
```bash
echo "  Hello    World  " | ./clean_text.sh
```

---

## 10.6 - Practical exercises

### `anonymize.sh`

```bash
#!/bin/bash

filename=$1

sed 's/[a-zA-Z0-9._-]*@[a-zA-Z0-9.-]*/[EMAIL REDACTED]/g' "$filename"
```

Test file creation:
```bash
cat > test_emails.txt << EOF
Contact john.doe@example.com for support.
You can also reach jane_smith@company.org
or admin@test-site.com for assistance.
EOF

./anonymize.sh test_emails.txt
```

### `convert_dates.sh`

```bash
#!/bin/bash

filename=$1

sed 's/\([0-9]\{4\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\)/\3\/\2\/\1/g' "$filename"
```

Simpler version (less strict):
```bash
#!/bin/bash

filename=$1

sed 's/\([0-9]*\)-\([0-9]*\)-\([0-9]*\)/\3\/\2\/\1/g' "$filename"
```

Test:
```bash
echo "Today is 2024-02-08 and tomorrow is 2024-02-09" > dates.txt
./convert_dates.sh dates.txt
```

### `quote_remover.sh`

```bash
#!/bin/bash

filename=$1

sed "s/['\"]//g" "$filename"
```

Or:
```bash
#!/bin/bash

filename=$1

sed 's/\"//g; s/'\''//g' "$filename"
```

Note: The `'\''` is a way to include a single quote in a single-quoted string.

Test:
```bash
echo 'He said "Hello" and I said '"'"'Hi'"'"'' > quotes.txt
./quote_remover.sh quotes.txt
```

---

## Bonus solutions

### Highlight ERROR in logs

```bash
#!/bin/bash

filename=$1

grep "ERROR" "$filename" | sed 's/ERROR/***ERROR***/g'
```

Or in one sed command:
```bash
#!/bin/bash

filename=$1

sed '/ERROR/!d; s/ERROR/***ERROR***/g' "$filename"
```

Explanation:
- `/ERROR/!d` - Delete (d) lines that do NOT (!) contain ERROR
- `s/ERROR/***ERROR***/g` - Replace ERROR with highlighted version

### Remove empty lines

```bash
#!/bin/bash

filename=$1

sed '/^$/d' "$filename"
```

Explanation:
- `/^$/` - Pattern matching empty lines (^ = start, $ = end, nothing between)
- `d` - Delete command

Or remove lines with only whitespace:
```bash
sed '/^ *$/d' "$filename"
```

Test:
```bash
cat > test_empty.txt << EOF
Line 1

Line 3

Line 5
EOF

./remove_empty.sh test_empty.txt
```

---

## Common sed patterns reference

### Basic substitution
```bash
sed 's/old/new/'          # Replace first occurrence per line
sed 's/old/new/g'         # Replace all occurrences
sed 's/old/new/gi'        # Replace all, case-insensitive
sed 's/old/new/2'         # Replace only 2nd occurrence
```

### Line addressing
```bash
sed '3s/old/new/'         # Replace only on line 3
sed '2,5s/old/new/'       # Replace on lines 2-5
sed '/pattern/s/old/new/' # Replace only on lines matching pattern
```

### Deletion
```bash
sed '/pattern/d'          # Delete lines matching pattern
sed '3d'                  # Delete line 3
sed '2,5d'                # Delete lines 2-5
sed '/^$/d'               # Delete empty lines
```

### Multiple commands
```bash
sed 's/a/A/g; s/b/B/g'    # Multiple substitutions
sed -e 's/a/A/g' -e 's/b/B/g'  # Same with -e
```

### Special characters
```bash
sed 's/\./DOT/g'          # Escape . (means any char)
sed 's/\*/STAR/g'         # Escape * (means zero or more)
sed 's/\[/BRACKET/g'      # Escape [ (starts character class)
```

### Capture groups and backreferences
```bash
sed 's/\(.*\)@\(.*\)/\1 at \2/'  # Rearrange email
sed 's/\([0-9]*\)-\([0-9]*\)/\2-\1/' # Swap numbers
```

### In-place editing (be careful!)
```bash
sed -i 's/old/new/g' file.txt     # Edit file directly (Linux)
sed -i '' 's/old/new/g' file.txt  # Edit file directly (macOS)
sed -i.bak 's/old/new/g' file.txt # Edit and create backup
```

### Common use cases
```bash
# Remove leading spaces
sed 's/^ *//'

# Remove trailing spaces
sed 's/ *$//'

# Remove comments (lines starting with #)
sed '/^#/d'

# Add prefix to each line
sed 's/^/PREFIX: /'

# Add suffix to each line
sed 's/$/ SUFFIX/'

# Convert Windows line endings to Unix
sed 's/\r$//'
```
