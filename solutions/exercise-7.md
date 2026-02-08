# Solutions - Exercise 7

## 7.2 - Simple case example

The complete `day_of_week.sh`:

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

Running `./day_of_week.sh Saturday` outputs "Weekend!" because Saturday matches the `Saturday|Sunday` pattern.

If you run with no arguments, the script outputs "Just another day" because an empty string doesn't match any specific pattern, so it falls through to the default `*)` case.

---

## 7.3 - Case with pattern matching

The complete `file_type.sh`:

```bash
#!/bin/bash

filename=$1

case $filename in
  *.txt)
    echo "Text file"
    ;;
  *.sh)
    echo "Shell script"
    ;;
  *.jpg|*.png|*.gif)
    echo "Image file"
    ;;
  *)
    echo "Unknown file type"
    ;;
esac
```

Bonus - with more file types:

```bash
#!/bin/bash

filename=$1

case $filename in
  *.txt)
    echo "Text file"
    ;;
  *.sh)
    echo "Shell script"
    ;;
  *.jpg|*.png|*.gif)
    echo "Image file"
    ;;
  *.pdf)
    echo "PDF document"
    ;;
  *.zip|*.tar|*.gz)
    echo "Archive file"
    ;;
  *.mp3|*.wav|*.flac)
    echo "Audio file"
    ;;
  *)
    echo "Unknown file type"
    ;;
esac
```

Bonus - with argument validation:

```bash
#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: ./file_type.sh <filename>"
  exit 1
fi

filename=$1

case $filename in
  *.txt)
    echo "Text file"
    ;;
  *.sh)
    echo "Shell script"
    ;;
  *.jpg|*.png|*.gif)
    echo "Image file"
    ;;
  *)
    echo "Unknown file type"
    ;;
esac
```

---

## 7.4 - Case with user input

The complete `calculator.sh`:

```bash
#!/bin/bash

op=$1
a=$2
b=$3

case $op in
  +)
    echo $((a + b))
    ;;
  -)
    echo $((a - b))
    ;;
  "*")
    echo $((a * b))
    ;;
  *)
    echo "Unknown operator. Use +, -, *, or /"
    ;;
esac
```

Note: The `*` needs to be quoted in the case pattern to prevent shell expansion.

Bonus - with division:

```bash
#!/bin/bash

op=$1
a=$2
b=$3

case $op in
  +)
    echo $((a + b))
    ;;
  -)
    echo $((a - b))
    ;;
  "*")
    echo $((a * b))
    ;;
  /)
    echo $((a / b))
    ;;
  *)
    echo "Unknown operator. Use +, -, *, or /"
    ;;
esac
```

Bonus - with modulo and power:

```bash
#!/bin/bash

op=$1
a=$2
b=$3

case $op in
  +)
    echo $((a + b))
    ;;
  -)
    echo $((a - b))
    ;;
  "*")
    echo $((a * b))
    ;;
  /)
    echo $((a / b))
    ;;
  %|mod)
    echo $((a % b))
    ;;
  "**"|power)
    echo $((a ** b))
    ;;
  *)
    echo "Unknown operator. Use +, -, *, /, %, or **"
    ;;
esac
```

Bonus - custom operations:

```bash
#!/bin/bash

op=$1
a=$2
b=$3

case $op in
  +)
    echo $((a + b))
    ;;
  -)
    echo $((a - b))
    ;;
  "*")
    echo $((a * b))
    ;;
  /)
    echo $((a / b))
    ;;
  avg)
    echo $(((a + b) / 2))
    ;;
  max)
    if [ $a -gt $b ]; then
      echo $a
    else
      echo $b
    fi
    ;;
  min)
    if [ $a -lt $b ]; then
      echo $a
    else
      echo $b
    fi
    ;;
  *)
    echo "Unknown operator"
    ;;
esac
```

Bonus - with validation:

```bash
#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: ./calculator.sh <operator> <num1> <num2>"
  echo "Operators: +, -, *, /"
  exit 1
fi

op=$1
a=$2
b=$3

case $op in
  +)
    echo $((a + b))
    ;;
  -)
    echo $((a - b))
    ;;
  "*")
    echo $((a * b))
    ;;
  /)
    if [ $b -eq 0 ]; then
      echo "Error: Division by zero"
      exit 1
    fi
    echo $((a / b))
    ;;
  *)
    echo "Unknown operator. Use +, -, *, or /"
    exit 1
    ;;
esac
```
