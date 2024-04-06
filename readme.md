![desktop](https://github.com/PigmanBruh/dotfiles/assets/87263998/bb8cbcd4-a789-44cf-a9ac-773b1aae7486)
## Welcome to PigmanBruh's Dotfiles Repository

While nothing stopping you from just copying my whole configuration, i would advise against doing that, just take what you need and adapt it to your use case and preferences


## Usage

This repo are managed with [chezmoi](https://chezmoi.io), and while it only handle home folder dotfiles by default, someone found a [workaround](https://github.com/twpayne/chezmoi/discussions/1510#discussioncomment-2627391) and i decided to modify and use it...

```
alias hezmoi="chezmoi --destination ~ --source '~/dotfiles/home' --working-tree '~/dotfiles/home'"
alias rezmoi="chezmoi --destination / --source '~/dotfiles/root' --working-tree '~/dotfiles/root'"
```