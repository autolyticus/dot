# termite-color
A shell script to painlessly switch between termite color schemes

Clone this repo to your termite config folder for seamless integration.

1. First backup your termite config folder
```
mv ~/.config/termite ~/.config/termite.bak
```
2. Next, clone this repo to your termite config directory
```
git clone https://github.com/reisub0/termite-color .config/termite
```
3. You're done! Copy back your termite config from the backup folder
```
cp ~/.config/termite.bak/config ~/.config/termite/
```





Then,

```
cd ~/.config/termite

./termite-color -c <color-file>
```

For example,
```
./termite-color -c colors/nord
```

If you wish, you may specify an alternate config folder with `-d` flag.
