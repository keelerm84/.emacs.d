# Emacs Configuration Files

## Setup

First, clone the repository and update all required submodules

    git clone git://github.com/keelerm84/.emacs.d.git
	cd .emacs.d
	git submodule init
	git submodule update --recursive

### Dependencies

The fuzzy-find-in-project package requires the fuzzy\_file\_finder ruby gem

    gem install fuzzy_file_finder

You also need to have gtags.el available on your system.  For Fedora, you can install it with

    sudo yum install emacs-global

In order to provide preview capabilities with the markdown plugin, you need to install a markdown converter.  For Fedora, you can install it with

    sudo yum install python-markdown2
    sudo ln -s /usr/bin/markdown2 /usr/bin/markdown
