# Solutions - Exercise 8

## 8.1 - While loops

The complete `countdown.sh`:

```bash
#!/bin/bash

count=5

while [ $count -gt 0 ]; do
  echo $count
  count=$((count - 1))
  sleep 1
done

echo "Blastoff!"
```

Modified to count from 10:

```bash
#!/bin/bash

count=10

while [ $count -gt 0 ]; do
  echo $count
  count=$((count - 1))
  sleep 1
done

echo "Blastoff!"
```

---

## 8.2 - Building a joke menu

The complete `joke_menu.sh`:

```bash
#!/bin/bash

while true; do
  echo ""
  echo "===== Terminal Humor ====="
  echo "1. Knock knock joke"
  echo "2. Fun fact"
  echo "3. ASCII art"
  echo "4. Quit"
  echo "=========================="
  echo -n "Choose an option: "

  read choice

  case $choice in
    1)
      echo ""
      echo "Knock knock!"
      echo "Who's there?"
      echo "A typo."
      echo "A typo w—"
      sleep 0.5
      echo "SYNTAX ERROR: unexpected character at line 1"
      ;;
    2)
      echo ""
      echo "Did you know? The first message sent over the"
      echo "internet (ARPANET) in 1969 was supposed to be"
      echo "'LOGIN', but it crashed after 'LO'. They tried"
      echo "again and got 'L' before crashing again."
      echo "So the first internet message was: 'LOL'"
      echo ""
      echo "The internet's first words were literally LOL! 😂"
      ;;
    3)
      echo ""
      echo "   _____ _          _ _ "
      echo "  / ____| |        | | |"
      echo " | (___ | |__   ___| | |"
      echo "  \___ \| '_ \ / _ \ | |"
      echo "  ____) | | | |  __/ | |"
      echo " |_____/|_| |_|\___|_|_|"
      ;;
    4)
      echo "Goodbye! May your scripts always exit 0!"
      exit 0
      ;;
    *)
      echo "Invalid option. Please choose 1-4."
      ;;
  esac
done
```

Pressing Ctrl+C sends a SIGINT signal that terminates the script immediately.

Adding option 5 (Tech Fortune Cookie):

```bash
#!/bin/bash

while true; do
  echo ""
  echo "===== Terminal Humor ====="
  echo "1. Knock knock joke"
  echo "2. Fun fact"
  echo "3. ASCII art"
  echo "4. Tech fortune cookie"
  echo "5. Quit"
  echo "=========================="
  echo -n "Choose an option: "

  read choice

  case $choice in
    1)
      echo ""
      echo "Knock knock!"
      echo "Who's there?"
      echo "A typo."
      echo "A typo w—"
      sleep 0.5
      echo "SYNTAX ERROR: unexpected character at line 1"
      echo ""
      echo "(Get it? The typo interrupted! 😄)"
      ;;
    2)
      echo ""
      echo "Did you know? The first message sent over the"
      echo "internet (ARPANET) in 1969 was supposed to be"
      echo "'LOGIN', but it crashed after 'LO'. They tried"
      echo "again and got 'L' before crashing again."
      echo "So the first internet message was: 'LOL'"
      echo ""
      echo "The internet's first words were literally LOL! 😂"
      ;;
    3)
      echo ""
      echo "   _____ _          _ _ "
      echo "  / ____| |        | | |"
      echo " | (___ | |__   ___| | |"
      echo "  \___ \| '_ \ / _ \ | |"
      echo "  ____) | | | |  __/ | |"
      echo " |_____/|_| |_|\___|_|_|"
      ;;
    4)
      fortune=$((RANDOM % 4))
      echo ""
      echo "🥠 Your Tech Fortune Cookie says:"
      case $fortune in
        0)
          echo "A bug in production is worth two in staging."
          ;;
        1)
          echo "Your code will compile on the first try..."
          echo "...in an alternate universe."
          ;;
        2)
          echo "The answer to your problem is in the"
          echo "documentation you didn't read."
          ;;
        3)
          echo "Today is a good day to refactor legacy code!"
          ;;
      esac
      ;;
    5)
      echo "Goodbye! May your scripts always exit 0!"
      exit 0
      ;;
    *)
      echo "Invalid option. Please choose 1-5."
      ;;
  esac
done
```

---

## 8.3 - Enhancing the menu

The enhanced `joke_menu.sh` with all options:

```bash
#!/bin/bash

while true; do
  echo ""
  echo "===== Terminal Humor ====="
  echo "1. Knock knock joke"
  echo "2. Fun fact"
  echo "3. ASCII art"
  echo "4. Tech fortune cookie"
  echo "5. Tell your own joke"
  echo "6. System info"
  echo "7. Quit"
  echo "=========================="
  echo -n "Choose an option: "

  read choice

  case $choice in
    1)
      echo ""
      echo "Knock knock!"
      echo "Who's there?"
      echo "A typo."
      echo "A typo w—"
      sleep 0.5
      echo "SYNTAX ERROR: unexpected character at line 1"
      echo ""
      echo "(Get it? The typo interrupted! 😄)"
      ;;
    2)
      echo ""
      echo "Did you know? The first message sent over the"
      echo "internet (ARPANET) in 1969 was supposed to be"
      echo "'LOGIN', but it crashed after 'LO'. They tried"
      echo "again and got 'L' before crashing again."
      echo "So the first internet message was: 'LOL'"
      echo ""
      echo "The internet's first words were literally LOL! 😂"
      ;;
    3)
      echo ""
      echo "   _____ _          _ _ "
      echo "  / ____| |        | | |"
      echo " | (___ | |__   ___| | |"
      echo "  \___ \| '_ \ / _ \ | |"
      echo "  ____) | | | |  __/ | |"
      echo " |_____/|_| |_|\___|_|_|"
      ;;
    4)
      fortune=$((RANDOM % 4))
      echo ""
      echo "🥠 Your Tech Fortune Cookie says:"
      case $fortune in
        0)
          echo "A bug in production is worth two in staging."
          ;;
        1)
          echo "Your code will compile on the first try..."
          echo "...in an alternate universe."
          ;;
        2)
          echo "The answer to your problem is in the"
          echo "documentation you didn't read."
          ;;
        3)
          echo "Today is a good day to refactor legacy code!"
          ;;
      esac
      ;;
    5)
      echo ""
      echo -n "Enter joke setup: "
      read setup
      echo -n "Enter punchline: "
      read punchline
      echo ""
      echo "Here's your joke:"
      echo "Q: $setup"
      echo "A: $punchline"
      ;;
    6)
      echo ""
      echo "=== System Info ==="
      echo "User: $(whoami)"
      echo "Directory: $(pwd)"
      echo "Date: $(date '+%A, %B %d, %Y')"
      echo "Time: $(date '+%I:%M:%S %p')"
      ;;
    7)
      echo "Goodbye! May your scripts always exit 0!"
      exit 0
      ;;
    *)
      echo "Invalid option. Please choose 1-7."
      ;;
  esac
done
```

---

## Bonus solutions

### Bonus - Display date and time (option 8)

Add before the Quit option:

```bash
8)
  echo ""
  echo "Current date and time:"
  date "+%A, %B %d, %Y at %I:%M:%S %p"
  echo ""
  echo "Fun fact: That's $(date +%s) seconds since Jan 1, 1970!"
  ;;
```

And update the menu and quit option numbers accordingly.

### Bonus - Number guessing game (option 9)

Add before the Quit option:

```bash
9)
  echo ""
  echo "I'm thinking of a number between 1 and 10..."
  target=$((RANDOM % 10 + 1))
  echo -n "Your guess: "
  read guess
  if [ $guess -eq $target ]; then
    echo "Correct! You guessed it!"
  else
    echo "Nope! It was $target. Better luck next time!"
  fi
  ;;
```

### Bonus - Counter tracking

Complete script with counter:

```bash
#!/bin/bash

counter=0

while true; do
  echo ""
  echo "===== Terminal Humor ====="
  echo "Items viewed: $counter"
  echo "=========================="
  echo "1. Knock knock joke"
  echo "2. Fun fact"
  echo "3. ASCII art"
  echo "4. Tech fortune cookie"
  echo "5. Tell your own joke"
  echo "6. System info"
  echo "7. Quit"
  echo "=========================="
  echo -n "Choose an option: "

  read choice

  case $choice in
    1)
      echo ""
      echo "Knock knock!"
      echo "Who's there?"
      echo "A typo."
      echo "A typo w—"
      sleep 0.5
      echo "SYNTAX ERROR: unexpected character at line 1"
      echo ""
      echo "(Get it? The typo interrupted! 😄)"
      counter=$((counter + 1))
      ;;
    2)
      echo ""
      echo "Did you know? The first message sent over the"
      echo "internet (ARPANET) in 1969 was supposed to be"
      echo "'LOGIN', but it crashed after 'LO'. They tried"
      echo "again and got 'L' before crashing again."
      echo "So the first internet message was: 'LOL'"
      echo ""
      echo "The internet's first words were literally LOL! 😂"
      counter=$((counter + 1))
      ;;
    3)
      echo ""
      echo "   _____ _          _ _ "
      echo "  / ____| |        | | |"
      echo " | (___ | |__   ___| | |"
      echo "  \___ \| '_ \ / _ \ | |"
      echo "  ____) | | | |  __/ | |"
      echo " |_____/|_| |_|\___|_|_|"
      counter=$((counter + 1))
      ;;
    4)
      fortune=$((RANDOM % 4))
      echo ""
      echo "🥠 Your Tech Fortune Cookie says:"
      case $fortune in
        0)
          echo "A bug in production is worth two in staging."
          ;;
        1)
          echo "Your code will compile on the first try..."
          echo "...in an alternate universe."
          ;;
        2)
          echo "The answer to your problem is in the"
          echo "documentation you didn't read."
          ;;
        3)
          echo "Today is a good day to refactor legacy code!"
          ;;
      esac
      counter=$((counter + 1))
      ;;
    5)
      echo ""
      echo -n "Enter joke setup: "
      read setup
      echo -n "Enter punchline: "
      read punchline
      echo ""
      echo "Here's your joke:"
      echo "Q: $setup"
      echo "A: $punchline"
      counter=$((counter + 1))
      ;;
    6)
      echo ""
      echo "=== System Info ==="
      echo "User: $(whoami)"
      echo "Directory: $(pwd)"
      echo "Date: $(date '+%A, %B %d, %Y')"
      echo "Time: $(date '+%I:%M:%S %p')"
      counter=$((counter + 1))
      ;;
    7)
      echo ""
      echo "You viewed $counter items. Thanks for playing!"
      echo "Goodbye! May your scripts always exit 0!"
      exit 0
      ;;
    *)
      echo "Invalid option. Please choose 1-7."
      ;;
  esac
done
```
