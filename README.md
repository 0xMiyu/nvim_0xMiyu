## Miyu's Neovim Setup

My first attempt at customizing my own nvim setup, after multiple failed attempts at trying to switch to out-of-the-box solutions eg. Astro Nvim.

Special thanks to the following 2 videos for being my main inspiration and guidance:

- [Devaslife's Neovim Setup](https://youtu.be/ajmK0ZNcM4Q)

- [ThePrimeagen's Neovim Nothing to LSP](https://youtu.be/w7i4amO_zaE)

Plugin List:

```bash
Coming Soon!
```

## To get Neorg Treesitter parser working on MacOS

```bash
brew install gcc
xcode-select --install
sudo xcode-select --switch /Library/Developer/CommandLineTools
CC=gcc-12 nvim -c "TSInstall norg"
```
