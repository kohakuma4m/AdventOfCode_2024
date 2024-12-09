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


# To run specific day solution, use

- `ghc` compiler to compile and run solution binary (both parts)
    ```
    > cd dayXX
    > ghc solution.hs
    > ./solution fileName           Both solutions
    ```

    or

- `ghci` interactive environment to run each part of the solution together or separately
    ```
    > cd dayXX
    > ghci solution.hs
    ghci> :main filename            Both solutions
    ghci> :run part1 filename       Part 1 solution only
    ghci> :run part2 filename       Part 2 solution only
    ```

# Disclaimer
This is my own personal sandbox. All solutions are work in progress...
I tend to revisit my previous solutions as I go along to cleanup my code, but I make no promises ^_^
