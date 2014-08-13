vim
===

My VIM config

Installation:
============

While I would recommend starting with vim from scratch, if you'd still like to a copy of my settings just:

    git clone https://github.com/Dissonant-Tech/vim ~/.vim

To clone the repo. Then pull and update submodules with:

    cd ~/.vim && git submodule update --init --recursive

Once that's done you'll have to compile YCM libraries. Use `--clang-completer` for semantic C and C++ language completion and `--omnisharp-completer` for semantic C# support.

    cd bundle/YouCompleteMe && ./install.sh --clang-completer

Finally move or link vimrc to ~/.vimrc.

    ln -s vimrc ~/.vimrc

Usage:
=====

Read the documentation for the respective plugins for usage information.
