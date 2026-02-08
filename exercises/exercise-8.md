# Exercise 8 - Menu-driven scripts

You will learn to:

- Create interactive menu-driven scripts
- Use while loops
- Combine while and case
- Build a simple CLI tool

## Required software and tools for this exercise

- Bash
- A terminal
- Visual Studio Code (or any text editor)

---

## 8.1 - While loops

:book: While loops repeat as long as a condition is true:

```bash
while [ condition ]; do
  # commands
done
```

:book: A common pattern for menus is `while true`, which creates an infinite loop that runs until you explicitly `break` or `exit`.

:pencil2: Create a simple while loop script `countdown.sh`:

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

:pencil2: Set execute permissions and run the script. You should see a countdown from 5 to 1, then "Blastoff!".

:book: The `-gt` means "greater than". The loop continues while `count` is greater than 0.

:pencil2: Try modifying the script to count down from 10 instead of 5.

---

## 8.2 - Building a joke menu

:book: A menu-driven script displays options, reads user choice, and acts accordingly. Let's build something fun!

:pencil2: Create `joke_menu.sh`:

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

:pencil2: Set execute permissions and run the script. Try each menu option.

:book: Notice how the script:

- Uses `while true` to loop forever
- Uses `read choice` to get user input
- Uses `case` to handle different choices
- Uses `exit 0` to quit the script (exit code 0 means success)

:question: What happens if you press Ctrl+C while the script is running?

:book: Ctrl+C sends a SIGINT signal that terminates the script immediately, even though it's in an infinite loop.

:pencil2: Now add your own menu option! Add option **5** that displays a random "Tech Fortune Cookie" message. Use a random number (remember `$RANDOM`) to select between 3-4 different fortune messages. Here are some example fortunes you could use:

- "A bug in production is worth two in staging."
- "Your code will compile on the first try... in an alternate universe."
- "The answer to your problem is in the documentation you didn't read."
- "Today is a good day to refactor legacy code!"

:bulb: Hint: Generate a random number with `$((RANDOM % 4))` (for 0-3), store it in a variable, then use a **nested case statement** inside your option 5 case to select which fortune to display.

:bulb: Remember to:
1. Update the menu display to show option 5
2. Update the "Quit" option number accordingly
3. Add a new case for option 5 with your fortune messages

---

## 8.3 - Enhancing the menu

:book: Now let's make the menu even more interesting by adding some interactive features. You should already have option 5 (Tech Fortune Cookie) from the previous section.

:pencil2: Modify your `joke_menu.sh` to add these new options:

**Option 6: Tell your own joke**

- Ask the user to enter a joke setup
- Ask for the punchline
- Display both with some formatting

:bulb: Hint: Use `echo -n` to print a prompt without a newline (so the user can type on the same line). Use `read variable_name` to read user input into a variable. Then you can use that variable with `$variable_name`.

**Option 7: System info**

- Display some useful system information
- Show the current username, current directory, and current date/time

:bulb: Hint: Use `whoami` to get the username, `pwd` to get current directory, and `date` to get the current date/time. You can format the output nicely with echo statements!

:pencil2: Update the menu display to show the new options (6 and 7).

:pencil2: Update the Quit option number accordingly (it should now be option 8).

:star: Bonus: Add an option that displays the current date and time in a fun format. Remember to update the Quit option number!

:star: Bonus: Add an option that plays a simple number guessing game (think of a number 1-10, user tries to guess).

:star: Bonus: Add a counter that tracks how many jokes/facts the user has viewed, and display it at the top of the menu.

---

## 8.4 - Menu best practices

:book: Here are some tips for creating good menu-driven scripts:

1. **Always provide a way to exit** - Don't trap users in infinite loops!
2. **Validate input** - Use the `*)` default case to catch invalid options
3. **Clear feedback** - Let users know what happened after each choice
4. **Visual separation** - Use blank lines and formatting to make menus readable
5. **Consistent numbering** - Number options sequentially

:pencil2: Review your `joke_menu.sh` - does it follow these best practices?

---

## Summary

In this exercise you learned how to create interactive menu-driven scripts using while loops and case statements. You combined these concepts to build a fun CLI tool that responds to user input. This pattern of `while true` + `read` + `case` is used in many real-world scripts for system administration, deployment tools, and interactive utilities.

### [Go to exercise 9 :arrow_right:](./exercise-9.md)
### [:star: Go to Bonus exercises :arrow_right:](./bonus-1.md)
