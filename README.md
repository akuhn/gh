# gh
A ruby script to open the GitHub page for a repository.

## Usage
    gh [remote-name] [branch-name]
    gh [commot-sha]

### Examples
    $ gh
    > open https://github.com/REMOTE_ORIGIN_USER/CURRENT_REPO/tree/CURRENT_BRANCH

    $ gh upstream
    > open https://github.com/REMOTE_UPSTREAM_USER/CURRENT_REPO/tree/CURRENT_BRANCH

    $ gh upstream master
    > open https://github.com/REMOTE_UPSTREAM_USER/CURRENT_REPO/tree/master

    $ gh SHA
    > open https://github.com/REMOTE_UPSTREAM_USER/CURRENT_REPO/commit/SHA

## Installation
On Unix systems you have several options. Namely creating an alias or a symbolic link to `gh.sh`.

I prefer to create a symbolic link within `/usr/local/bin/`:

    ln -s gh.rb /usr/local/bin/gh

**Note:** `open` my not work across all platforms. On some Linux distributions you can replace `open` to `xdg-open`.
