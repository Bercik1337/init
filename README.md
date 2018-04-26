INIT SCRIPT
-----------

Tired of this scenario?: 
you login into new box, or deploy your own, but since it's a fresh install you don't have your aliases, custom colors, PS1 prompt, vim/nano setup, htop layout and more?

This INIT script is your solution. Of course we could host those files on some http/scp server, but here it's hosted on github, and entire process is automated. So you are ready to go under 1 minute.

- - - - - - - 
This package contains:

00-backup-current.sh	Copies current configuration. bashrc and other files that will be changed.

01-prep-user.sh		Prepare user env:  bashrc vimrc nanorc, and so on...

02-prep-root.sh		Same as 01 but for root. Plus some more con/var files often used on my boxes.

99-uninstall.sh		Restores stuff from archive created by 00-backup-current.sh

README.md		Well, you are looking at it right now.

other files/folders	Everything else needed for this script. Some files are hidden. They will be deployed after 			   you run 0*.sh
- - - - - - - 

I do know, that this is no rocket sience. But I deploy A LOT of systems. Also help around friends. This entire process to setup system how I like it always takes some time. It got so annoying that I decided to automate it. 

Feel free to modify it. 
