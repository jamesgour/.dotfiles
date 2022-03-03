# Whenever a change to the dotfiles repo occurs, call: 
# $ make

# To delete all dotfile-related symlinks from the machine:
# make delete

# These calls should always happen from your .dotfiles directory

all:
	stow --verbose --target=$$HOME --restow */

delete:
	stow --verbose --target=$$HOME --delete */
