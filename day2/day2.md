# Basic commands in Linux
## basic commands

### for checking the date
```bash
 date
 ```
### for changing the directory
```bash
cd /
```
*u can add path after the slash*

### for checking the present working directory

```bash
pwd
```
### for check the content of the directory
```bash
 ls 
 ```
 `list out the files in the current directory`
 
```bash
 ls -lah 
 ```
 `-l` *long listing format* `-a` *include hidden content* `-h` *human-readable size*
 
```bash
 ls -lrt 
 ```
 `-r` *reverse the sort order*
 `-t` *sort by modification time*

### for creating a directory
```bash
mkdir decode 
```
### creating a file using touch 
```bash 
touch file1
```

### creating a file using cat
```bash
cat >file2
```

### creating a file using text - editor
```bash
gedit file3
```
***replace filename with the name u want to give***

### opening a file and creating using vim text edit
```bash
vi file4
```

* entering in the insert mode using i
* exiting using esc key
* writing mode :w
* quit :q

***for changing the things into whole file***
`:%s/aging/AGING/g `
*g means globally*
*replace the word aging with the word u want to replace and AGING with the word u want to add inplace*

### downloding the file using wget and curl
```bash
wget "file link" 
```
```bash
curl -o "file link" 
```
***-o means outoput will be saved***

### pattern matching using grep
```bash
grep "pattern" <filename> 
```
#### use of pipe |
```bash
grep "pattern" <filename > | wc 
```
#### flags
* `-i` *for ignoring the pattern*
* `-E` *use extended regular expression*
* `-v` *show lines that dont match*
* `-r` *recursive search*
* `-l` *show only filenames that contain the match*
* `-L` *show only filenames without the match*
* `-n` *show line no with matched lines*
* `-c` *count no of matching lines*
* `-o` *show only the matched part*
* `-w` *matches the whole word only*
* `-x` *matches the whole line only*
* `-f` *get patterns from a file*
* `-e` *specify multiple patterns*
* `--color` *highlight the matching text in colour*

### counting the content
```bash
wc <filename> 
```

## user permissions
### giving permission numeric way
```bash
chmod 750 <filename> 
```
* 4 for read
* 2 for write
* 1 for execute
* first charachter of no is for owner
* second charchter of no is for group
* third charachter of no is for others
***in this case  7(4+2+1) means owner has read,write and execute permission, while 5(4+1) means group has read and execute permission and others hav 1 means only execute permission*** 

### giving permission alphabetic way
```bash
chmod u+x <filename>
```

```bash
chmod g+r <filename>
```
* u is for user
* g is for group
* o is for others
* r stands for read permission
* w stands for write permission
* x stands for execute permission
* + stands for adding permission
* - means removing permission

## compress the file
```bash
gzip <filename> 
```
## unzip the file 
```bash
unzip <filename>
```

## for getting the help and reading manual
```bash
man ls
```

```bash
ls --help
```
## use of awk and sed
