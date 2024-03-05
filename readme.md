## Welcome to PigmanBruh's Dotfiles Repository

While the purpose of dotfiles repo is for personal config backup, i would still treat this just like any other repo i made

And while nothing stopping you from just copying my whole configuration, i would advise against doing that, at least modify and adapt it to your own use case


## Usage

This repo are managed with [chezmoi](https://chezmoi.io), and while it only handle home folder dotfiles by default, someone found a [workaround](https://github.com/twpayne/chezmoi/discussions/1510#discussioncomment-2627391) and i decided to use it...

    alias schezmoi="sudo chezmoi --destination / --source '/home/pigmanbruh/Git Repos/dotfiles/' --working-tree '/home/pigmanbruh/Git Repos/dotfiles/'"