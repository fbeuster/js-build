# JS Build
This is a small shell script, that allows you to import JavaScript files into other ones.
I made it during an IBM 10% Hackday at work and it's probably very limited but works for
my use.

Any suggestions for improvements are appreciated.

## Usage
### Import in JavaScript
Right now you can only import JavaScript files into a main file. The way you do this in
your JavaScript code is
```
//@ imported_code
//@ sub_folder/more_code
console.log('hello world')
```
In the case above you have the following folder structure
```
|
+- my_source.js
+- imported_code.js
+- sub_folder
   |
   +- more_code.js
```
Every line of `//@ some_name` is interpreted as a single JavaScript file you want to import.
### Build the Code
To run the build once and merge the main and import files, just do
```
$ ./js-build.sh my_source.js
```
The file is written in the same directory the original main file is placed and will have an `_compiled` in its file name.

### Using the file system listener
If you want to start the change listener (requires **inotify-tools** to work):
```
$ ./js-build-watch.sh my_source.js
```
This listens to any file changes in all subdirectories of your main javaScript file.

## Possible Features
- [ ] include complete sub directories
- [ ] clean up the include keyword in `js-build.sh`
- [ ] allow users to set output file
