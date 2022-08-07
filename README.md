## pulsar17's dotfiles
These are my dotfiles. Feel free to choose and pick from them and make your system your own!

### How to use
I manage my configs using GNU [stow](https://www.gnu.org/software/stow/). To install it on Debian and its derivatives, run:

```bash
sudo apt install stow
```

After the install, change into the `dotfiles` directory *(I usually clone the repo at `~/dotfiles`)*:

```bash
cd dotfiles/ # important
```

Then for each application that you want to have configured like mine, stow its directory

```bash
stow nvim
stow sqlite
```

Or if you want to copy all my configs and are feeling lazy like me, use:

```bash
find . -maxdepth 1 -type d -name '[!.]*' -exec stow '{}' \;
```

This will run `stow` for every directory under `dotfiles/`.

Enjoy 🎉🍒
