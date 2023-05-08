# bootstrap dotfiles

This repository can bootstrap a different dotfiles source for Gitpod, even from private or custom Git servers.

Can be useful for working around [#14984](https://github.com/gitpod-io/gitpod/issues/14984). So for example, if you have a public or private repo hosted on Gitea or elsewhere, you could bootstrap into that through this.

# Initial setup

Depending on the **Git provider** you have connected on https://gitpod.io/user/integrations, you will need to clone this repo in that Git server and then set the **Dotfile > Repository URL** to that in https://gitpod.io/user/preferences. For example, if you have Gitlab connected and you cloned this repo into `https://gitlab.com/you/repo.git`, you will use that URL as your dotfiles in https://gitpod.io/user/preferences

# A public repo

- Go to https://gitpod.io/user/variables and click on `New Variable`
- Create a new variable with the following:
    - Name: `DOTFILES_BOOTSTRAP_LINK`
    - Value:
    The target dotfiles you want to install, for example:
    ```
    https://gitpod:gitpod@example.com/you/actual_dotfiles_repo.git
    ```
    - Scope: `*/*`

# A private repo

- Go to https://gitpod.io/user/variables and click on `New Variable`
- Create a new variable with the following values:
    - Name: `DOTFILES_BOOTSTRAP_LINK`
    - Value:
    The target dotfiles you want to install, for example:
    ```
    https://auth_user:auth_pass@example.com/you/actual_dotfiles_repo.git
    ```
    - Scope: `*/*`