Contributing to JBoss Scripts 
==========================================

Each script is contained in a `.asciidoc` file in this git repository. To build the scruptsl you'll need [AsciiDoc](http://www.methods.co.nz/asciidoc/index.html) installed. It's available via most major packaging systems (e.g. Debian, Fedora Extra, MacPorts), and has a Windows installer.

You'll also need pygments for syntax highlighting. It's available as a python egg.

Once you have installed AsciiDoc, you can build individual sections by invoking `asciidoc -b <output of choice> <section.txt>`. If you want to generate all scripts as html, you can call `./generate.sh`.
