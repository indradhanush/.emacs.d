Emacs Config
===

This is my config for Emacs 26.1. Works best on Linux, but should work
on OSX as well.

**How to use this**

```
cd ~

# Backup your existing config
mv .emacs.d .emacs.d.backup

# Clone the repo

git clone https://github.com/indradhanush/.emacs.d.git
```

The configs use `use-package` and the packages will be installed on
the fly. `use-package` itself will be installed if it isn't already
available.
