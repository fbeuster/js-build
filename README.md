# JS Build
[![BSD-2-Clause License](https://img.shields.io/badge/License-BSD--2-blue.svg)](https://github.com/fbeuster/js-build/blob/master/LICENSE.md)

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
$ ./js-build my_source.js
```
The file is written in the same directory the original main file is placed and will
have an `_compiled` in its file name.

**Note:** You can also set your own output file. Read more in a later section.

### Using the file system listener
If you want to start the change listener (requires **inotify-tools** to work):
```
$ ./js-build-watch my_source.js
```
This listens to any file changes in all subdirectories of your main javaScript file.

###Setting a custom output file###
If you don't want a pre-set output file with `_compiled` and need a custom one, you can define
it like one of the following options:
```
$ ./js-build source.js output.js
$ ./js-build-watcher source.js output.js
```

That creates (or overrides) the `output.js` file, which is stored in the same directory
as the defined `source.js`.

## Possible Features/Improvements
- [ ] include complete sub directories
- [ ] clean up the include keyword in `js-build.sh`
- [x] allow users to set output file
- [x] clear error messages
- [x] run build after watcher started
- [x] get rid of .sh
