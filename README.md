## vim-castle for homesick

it's my config for vim-related files managed via homesick.

## install

first, install `vundle`:

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

then clone and link this castle

```
homesick clone lubieniebieski/vim-castle
homesick symlink lubieniebieski/vim-castle
```

you need to add `tmp` folders:

```
mkdir ~/.vim/tmp/backup ~/.vim/tmp/swap
```

don't forget to do `:BundleInstall` in vim after all is cloned!
