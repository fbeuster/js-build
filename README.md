# JS Build
This is a small shell script, that allows you to import JavaScript files into other ones.
I made it during an IBM 10% Hackday at work and it's probably very limited but works for
my use.

Any suggestions for improvements are appreciated.

## Usage
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

To run the build once, just do
```
$ ./js-build.sh my_source.js
```

If you want to start the change listener:
```
$ ./js-build-watch.sh my_source.js
```

## Possible Future
- [ ] include complete sub directories
- [ ] clean up the include keyword in `js-build.sh`