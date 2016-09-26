
#9.1 How the Web Works
Release 1: Web Servers

####1) What are some of the key design philosophies of the Linux operating system?

* "do one thing and do it well" - linux programs should perform a single task
* "a large set of simple tools" - tools can be combined with others for maximum flexibility and predictable results
* "output to input" - expect a program's output to be the input for another program, even if that program doesn't exist. Don't clutter output with needless data

####2) In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

A VPS is basically a virtual computer that has its own operating system and memory. A VPS can then be used as a server. The advantages are that a VPS can be easily set up online for cheaper than a full dedicated physical server. It's easy to scale up or down depending on your needs. Since it's a virtual machine, you can just buy extra space or memory instead of physically installing it on a server.

####3) Why is it considered a bad idea to run programs as the root user on a Linux system?

Since you are running the programs as the root users, you will have root-level access to everything, which could be dangerous if you make a mistake (that normally would only make the changes for a specific user or ask permission)or introduce a virus. 