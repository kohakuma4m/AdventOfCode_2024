# AdventOfCode_2024
Advent of Code 2024 solutions (haskell 9.4.8)


# Setup

To setup Haskell on your computer, follow this [guide](https://www.haskell.org/get-started/)

1. Install [GHCup](https://www.haskell.org/ghcup/)

    - **Important**: This does not install required dependencies
    ---
    - After install, run `ghcup tool-requirements` to list which other packages to install. Then install missing packages for your Linux distro
        - e.g: `apt install libgmp10 libgmp-dev` for `gmp` dependency
        - e.g: `apt install install libncurses5-dev libncursesw5-dev` for `ncurses` dependency

2. Then install [VSCode extension](https://open-vsx.org/vscode/item?itemName=haskell.haskell) for Haskell support

# To install packages, run

```
$ cabal install
```

# To run specific day solution, use

```
$ cabal run dayXX filename
```

Where `dayXX` is the solution folder, and `filename` is the input file name (without the `.txt` extension)

### Alternative

You can use solution interactively with ghci by using

```
$ cabal repl dayXX
ghci> :run main dayXX/filename              Both parts
ghci> :run part1 dayXX/filename             Part 1 only
ghci> :run part2 dayXX/filename             Part 2 only
```

# Disclaimer
This is my own personal sandbox. All solutions are work in progress...
I tend to revisit my previous solutions as I go along to cleanup my code, but I make no promises ^_^
