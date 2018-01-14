# devbox

Create a linux environment with tools and dotfiles in a container.

## build

Update `gitconfig.local` with your info.

`docker build -t devbox .`

## update plugins

If a fresh copy of plugins are copied here remove the .git files with:

`( find . -type d -name ".git" && find . -name ".gitignore" && find . -name ".gitmodules" ) | xargs rm -rf`
