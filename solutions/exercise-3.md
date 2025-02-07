# Solutions - Exercise 3

### 3.4 Accessing command-line arguments

_Modify the `args.sh` script so that it takes two arguments and prints the following output: `You are executing the script with the following arguments: <first_argument> <second_argument>`._

```bash
#!/bin/bash
echo "You are executing the script with the following arguments: $1 $2"
```

### 3.5.1 For-loops

_Create a bash script with a for loop which prints the following:_

```
red
green
blue
```

```bash
#!/bin/bash
for color in red green blue
do
    echo $color
done
```

_Create a bash script with a for loop which prints the following:_

```
The number is 2
The number is 3
The number is 4
The number is 5
The number is 6
```

```bash
#!/bin/bash
for number in $(seq 2 6)
do
    echo "The number is $number"
done
```

_Create a bash script with a for loop and a `seq` command which prints the following:_

```
The number is 2
The number is 4
The number is 6
The number is 8
The number is 10
```

```bash
#!/bin/bash
for number in $(seq 2 2 10)
do
    echo "The number is $number"
done
```

#### 3.5.3 Functions in Bash

_Write a script `sum.sh` that defines a function `sum` and calls it with arguments 1 and 2. The function should return the sum of the two arguments._

```bash
#!/bin/bash
function sum() {
  echo $(($1 + $2))
}

sum 1 2
```

_Write a script `largest.sh` that defines a function `largest` and calls it with arguments 10 and 20. The function should return the largest of the two arguments._

```bash
#!/bin/bash
function largest() {
  if [ $1 -gt $2 ]; then
    return $1
  else
    return $2
  fi
}

largest 10 20
echo $?
```

_Call the `largest` function with arguments from the command line and print the result._

```bash
#!/bin/bash
function largest() {
  if [ $1 -gt $2 ]; then
    return $1
  else
    return $2
  fi
}

largest $1 $2
echo $?
```

_Add an if-statement which check whether two command-line arguments are provided. If not, print `You must provide two arguments for the script to work`._

```bash
#!/bin/bash
function largest() {
  if [ $1 -gt $2 ]; then
    return $1
  else
    return $2
  fi
}

if [ $# -ne 2 ]; then
  echo "You must provide two arguments for the script to work"
  exit 1
fi

largest $1 $2
echo $?
```

#### 3.5.4 Combining for-loops and if-statements

_Write a script `even_numbers.sh` that prints out all even numbers between 1 and 20._

:bulb: We could simply use `seq 2 2 20`, but then we would not practice if-statements ;)

```bash
#!/bin/bash
for i in $(seq 1 20)
do
  if [ $((i % 2)) -eq 0 ]; then
    echo $i
  fi
done
```

_Write a script `even_numbers_between.sh` that takes two arguments and prints out all even numbers between the two arguments._

```bash
#!/bin/bash
from=$1
to=$2
for i in $(seq $from $to)
do
  if [ $(($i % 2)) -eq 0 ]; then
    echo $i
  fi
done
```

_Write a script `is_prime.sh` that takes one argument and checks if the argument is a prime number. It prints `Prime` if the number is prime, and `Not prime` if the number is not prime._

```bash
#!/bin/bash
n=$1
prime=1
for i in $(seq 2 $(($n-1)))
do
  if [ $(($n % $i)) -eq 0 ]; then
    prime=0
  fi
done

if [ $prime -eq 1 ]; then
  echo "Prime"
else
  echo "Not Prime"
fi
```

_Bonus challenge: stop checking the divisibility when you first encounter a number that is a divisor of the given number._

```bash
#!/bin/bash
n=$1
prime=1
max_bound=$((n - 1))
for i in $(seq 2 $max_bound)
do
  echo "Checking $i"
  if [ $(($n % $i)) -eq 0 ]; then
    prime=0
    break
  fi
done

if [ $prime -eq 1 ]; then
  echo "Prime"
else
  echo "Not Prime"
fi
```

_Bonus challenge: write a function `sqrt` which calculates the square root of a number, rounded down to the nearest integer. You can then test divisibility of the given number by all numbers in the range 2..sqrt(n).._

```bash
#!/bin/bash
function sqrt() {
    n=$1
    for (( i=1; i<n; i++ )); do
        if (( i * i == n )); then
            echo $i
            return
        elif (( i * i > n )); then
            echo $((i - 1))
            return
        fi
    done
    echo 0
}

n=$1
prime=1
max_bound=$(sqrt $n)
echo "Checking up to $max_bound"
echo "n is $n"
for i in $(seq 2 $max_bound)
do
  echo "Checking $i"
  if [ $(($n % $i)) -eq 0 ]; then
    prime=0
    break
  fi
done

if [ $prime -eq 1 ]; then
  echo "Prime"
else
  echo "Not Prime"
fi
```

_Bonus challenge: write a script `primes.sh` which prints out all prime numbers between 1 and 100._

```bash
#!/bin/bash
for i in $(seq 1 100)
do
  is_prime_number=$(./is_prime.sh $i)
  if [ $is_prime_number -eq 1 ]; then
    echo $i
  fi
done
```

The modified `is_prime.sh` script is as follows:

```bash
#!/bin/bash
function sqrt() {
    n=$1
    for (( i=1; i<n; i++ )); do
        if (( i * i == n )); then
            echo $i
            return
        elif (( i * i > n )); then
            echo $((i - 1))
            return
        fi
    done
    echo 0
}

n=$1
prime=1
max_bound=$(sqrt $n)
for i in $(seq 2 $max_bound)
do
  if [ $(($n % $i)) -eq 0 ]; then
    prime=0
    break
  fi
done

if [ $prime -eq 1 ]; then
  echo 1
else
  echo 0
fi
```

#### 3.5.5 More scripting exercises

_Make a script that uses a for loop to print out the first few lines of each file in a directory._

```bash
#!/bin/bash

for filename in ./*
do
    head -n 2 "$filename"
    printf "\n\n"
done
```

_Make a variable containing the path of a directory or a file that exists in your filesystem.
Make a test that checks whether the path exists, and if is a directory or a regular file. Print `Path does not exist` if the file doesn't exist. Print `Path is a directory` if the path is a directory, or `Path is a file` if the path is a regular file. Create a script that you can run to check the status of the path currently stored in your variable (e.g. `./filecheck.sh`)._

```bash
MY_PATH="Insert the path to your file here"

if [[ -e $MY_PATH ]]
then
    if [[ -f $MY_PATH ]]
    then
        echo "Path is a file"
    else
        echo "Path is a directory"
    fi
else
    echo "Path does not exist"
fi

```

_Instead of storing the path of the file or folder you want to check, can you pass it in as a parameter to the script? (E.g. `./filecheck.sh /home/myfolder`)._

```bash
# Check if the parameters were passed. Exit if not.
if [[ $# -ne 1 ]]
then
    echo "Invalid number of parameters. Pass 1 parameter containing the path to a file or directory"
    exit 1
fi

if [[ -e $1 ]]
then
    if [[ -f $1 ]]
    then
        echo "Path is a file"
    else
        echo "Path is a directory"
    fi
else
    echo "Path does not exist"
fi
```

_Are you able to use the variable containing the file or directory, printing the path of the file in the output? E.g. `"/home/root/file.txt" is a file`._

```bash

# Check if the parameters were passed. Exit if not.
if [[ $# -ne 1 ]]
then
    echo "Invalid number of parameters. Pass 1 parameter containing the path to a file or directory"
    exit 1
fi

if [[ -e $1 ]]
then
    if [[ -f $1 ]]
    then
        echo "$1 is a file"
    else
        echo "$1 is a directory"
    fi
else
    echo "$1 does not exist"
fi
```
