# [Learn Bash by Building a Website Boilerplate](https://github.com/freeCodeCamp/learn-bash-by-building-a-boilerplate/blob/main/TUTORIAL.md)

- `pwd` stands for "print working directory".
- `ls` stands for "list".
- `cd` stands for "change directory".
- You can see what's in a file with `more <filename>`.
- You can empty the terminal with `clear`.
- You can add a *flag* to a command to use it different ways like this: `ls <flag>`. List the contents of a folder in "long list format" by adding the `-l` flag to the "list" command.
- Make a new folder. It's the `mkdir` command: `mkdir <folder_name>`
- The `echo` command lets you print anything to the terminal.
- You can use `touch <filename>` to create a new file. 
- Most commands have a `--help` flag to show what the command can do. Usage: `ls --help`
- Scroll through the ls-menu to see the flags that go with `ls`. The flag you are looking for is `--all`, or `-a` for short - for listing all files.
- You can copy a file with `cp <file> <destination>`. `cp` stands for "copy".
- You can remove a file with `rm <filename>`.
- You can rename them with `mv` like this: `mv <filename> <new_filename>`. `mv` stands for "move", it can *rename or move* something.
- You can use `find` to find things or view a file tree. Enter `find` to view the file tree of a folder to see all the files and folders within it.
- You can use `find <folder_name>` to display the tree of a different folder.
- What else can `find` do? View the "help" menu of the `find` command to look around. Enter `find --help` in the terminal.
- There's a `-name` flag in there. You can use it to search for something with `find -name <filename>`.
- You can search for folders with it as well, using the same command and flag
- You can use `rmdir <directory_name>` to remove a folder. `rmdir` stands for "remove directory".
- Remove Recursively: There's a `-r` flag that says, `remove directories and their contents recursively`. That will remove the folder and everything in it. Usage: `rm -r <folder>`.
- You should **be very careful when recursively removing files** like that. It will delete everything, and can destroy your operating system.
- You can print to a file instead of the terminal with `echo text >> filename`.
- You can recursively copy with `-r` flag to copy the whole folder. Usage: `cp -r <folder_to_copy> <name_of_copy>`
- Use the `exit` command to exit the terminal.