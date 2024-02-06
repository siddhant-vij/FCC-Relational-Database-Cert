# [Learn Bash Scripting by Building Five Programs](https://github.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs/blob/main/TUTORIAL.md?plain=1)


- You can run commands in the terminal or put them in a file to be run as a script. Making five small programs to learn some scripting. The first one will be a "questionnaire".
- Add the text `echo hello questionnaire` at the top of the file. Your script has one command. Run it with `sh questionnaire.sh` to see what happens. `sh` stands for `shell`.
- Using `sh` to run your script uses the `shell` interpreter. Run your script again with `bash questionnaire.sh` to use the `bash` interpreter. `bash` stands for `bourne-again shell`.
- There are many interpreters which may not give the output you expect. Find out where the `bash` interpreter is located by entering `which bash` in the terminal.
- You can tell your program to use it by placing a `shebang` at the very top of the file like this: `#!<path_to_interpreter>`. Add a `shebang` at the very top of your file, the one you want looks like this: `#!/bin/bash`.
- Now, instead of using `sh` or `bash` to run your script. You can run it by executing the file and it will default to bash. Execute your script with `./questionnaire.sh`. You will get a permission denied error.
- You should have got a permission denied message because you don't have permissions to execute the script.
- With `ls -l` against this file - there's no `x` anywhere, so nobody can execute it. Enter `chmod +x questionnaire.sh` in the terminal to give everyone executable permissions.
- Run your file again by executing it with `./questionnaire.sh`. Now it works.
- In your script, you can add any commands that you would be able to enter in the terminal. 
- Bash has variables, functions, and other things you might be familiar with. You can create a variable with `VARIABLE_NAME=VALUE`. There cannot be any spaces around the equal (`=`) sign. If a variable has any spaces in it, place double quotes around it.
- To use a variable, place `$` in front of it like this: `$VARIABLE_NAME`. Shell scripts run from top to bottom, so you can only use variable below where it's created.
- Use `echo` to print your variable.
- Next, you want to be able to accept input from a user. You can do that with `read` like this: `read VARIABLE_NAME`. This will get user input and store it into a new variable.
- You can press `ctrl+c` to close the program after it starts if you don't want to enter values.
- Use flags like follows with echo to print your variables and input:
  - `echo -n` will not add a new line.
  - `echo -e` will add a new line.
  - eg. `echo -e "hello\nvariable"` will print hello and the variable on a new line.
- Comments in `bash` look like this: `# <comment>`.
- Programs can take arguments. You can access them a few different ways with `$`. Add `echo $*` in your script to print all arguments passed to it.
- `$*` prints all the arguments passed to your script. To access any one of them, use `$<number>`. e.g. `arg2` could have been accessed with `$2`. Usage: Run your file with `./FILENAME.sh arg1 arg2 arg3`.
- The syntax of an `if` condition is:
  ```sh
  if [[ CONDITION ]]
  then
    STATEMENTS
  fi
  ```
- One of the optional parts of `if` is an `else` area. You can use it like this:
  ```sh
  if [[ CONDITION ]]
  then
    STATEMENTS
  else
    STATEMENTS
  fi
  ```
- You can compare integers inside the brackets (`[[ ... ]]`) of your `if` with `-eq` (equal), `-ne` (not equal), `-lt` (less than), `-le` (less than or equal), `-gt` (greater than), `-ge` (greater than or equal).
- Each command has an exit status that can be accessed with `$?`. View the exit status of the **last command** with `echo $?`.
- You can think of an exit status of `0` as true. But it means that the command had zero errors. All commands have an exit status. Using the same syntax, enter `bad_command;` and check its exit status on a single line.
  - `command not found`, with an exit status of `127`. Anything but `0` means there was an error with the command. `bad_command` didn't exist. Try it again with `ls`.
- You can test multiple expressions with `&&` and `||`. Enter `[[ -x FILENAME.sh && 5 -le 4 ]]; echo $?` in the terminal to test the file is executable by you **and** five is less than or equal to four.
  - Similaryl, you can test for multiple conditions with `||`.
- Example usage for `if` - checking if the first argument is a positive integer:
  ```sh
  if [[ $1 -gt 0 ]]
  then
    echo true
  else
    echo Include a positive integer as the first argument.
  fi
  ```
- Example usage for `for` - counting down from 10 to 1:
  ```sh
  for (( i = 10; i > 0; i-- ))
  do
    echo $i
  done
  ```
  - The above creates a variable (`i = 10`), then prints it, subtracts one, and repeats until `i` is not greater than `0`. So it prints `10` through `1`.
- In your `for` loop, use `sleep` to make the script pause for `1` second after each number is printed.
  - Add `sleep 1` after you print `i` in your `for` loop
- You can create a multiline comment like this:
  ```sh
  : '
    comment here
    more comment here
  '
  ```
- The menu showed that you can make a `while` loop like this:
  ```sh
  while [[ CONDITION ]]
  do
    STATEMENTS
  done
  ```
- As a reminder, `(( ... ))` will perform a calculation or operation and output nothing. `$(( ... ))` will replace the calculation with the result of it.
- `if` statements can have multiple "else if" areas like this:
  ```sh
  if CONDITION
  then
    STATEMENTS
  elif CONDITION
  then
    STATEMENTS
  ...
  else
    STATEMENTS
  fi
  ```
- You can create an array like this: `ARR=("a" "b" "c")`
  - Each variable in the array is like any other variable, just combined into a single variable. In the terminal, print the second item in the array with `echo ${ARR[1]}`. Note that the first item would be index zero.
- Type `echo ${ARR[@]}` to print all the items in the array.
- You can create a function like this:
  ```sh
  FUNCTION_NAME() {
    STATEMENTS
  }
  ```
  - Call your function by putting the name of it below where you create it. No `$` needed.
- The `until` loop is very similar to the `while` loop you used. It will execute the loop until a condition is met. Here's an example:
  ```sh
  until [[ CONDITION ]]
  do
    STATEMENTS
  done
  ```