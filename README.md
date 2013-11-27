# Emacs Configuration Files

## Setup

First, clone the repository and update all required submodules

    git clone git://github.com/keelerm84/.emacs.d.git
    cd .emacs.d
    git submodule init
    git submodule update --recursive

### Dependencies

In order to provide preview capabilities with the markdown plugin, you need to
install a markdown converter.  For Fedora, you can install it with

    sudo yum install python-markdown2
    sudo ln -s /usr/bin/markdown2 /usr/bin/markdown

The use of the global tagging system requires the emacs-global extension.

    sudo yum install emacs-global

In order to get the syntax highlighting in exported PDF documents from Org
Mode, you need to install the python pygments and LaTeX minted packages.

    sudo yum install texlive-minted
    sudo python3-pip install pygments

Scala integration requires a couple of tools.  Obviously, you must install
scala and sbt, but also the
[ensime-sbt-cmd](https://github.com/aemoncannon/ensime-sbt-cmd) plugin.  Follow
the documentation in the github README for installation details.
