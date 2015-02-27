NewtonScript Syntax Coloring for Xcode 6
====

An [Xcode](https://developer.apple.com/xcode/downloads/) language specification for the NewtonScript language.
This enables syntax coloring in the editor.
Keywords & functions sourced from [The NewtonScript Programming Language](http://manuals.info.apple.com/en_US/NewtonScriptProgramLanguage.PDF) 1996, Apple Computer, Inc.

By Simon Bell <simon@newtonresearch.org> based on code created by Tiago Bastos for Lua.

SUPPORTS
----

* Single & Multi-line Comments
* Strings
* Numbers
* Keywords
* Folding:
	* Frames
	* Arrays

TO-DO
----

* Add functions to navigation pop-up menu
* Code folding of begin-end blocks

INSTALLATION
----

* Quit Xcode if it is running.
* Run the install.sh script. This copies the NewtonScript language spec into the Xcode package.
* Relaunch Xcode. The first time you view a NewtonScript source file you will need to select the Editor > Syntax Coloring > NewtonScript menu item to identify the file to Xcode.

You may need to reinstall when Xcode is updated.
Although undocumented, Apple has not changed the language parsing mechanism much since Xcode 1 so this should be good for some time yet.
