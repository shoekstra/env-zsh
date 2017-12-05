# Userenv zsh plugin

This plugin automatically sources any file called `$USER.env` when it exists in the current working directory. For example, for a user logged in as "schoon", this plugin will look for `schoon.env` in two situations:

- When the shell first starts (e.g. you open a new window or tab).
- When you change the current working directory.

Because this uses `source`, you can put _any_ valid zsh code in this file! You can add functions, change the `PATH`, etc.

On the other hand, there's a caveat: because this plugin uses `source`, any changes you make will persist for as long as the shell is alive. For example, if two directories (e.g. two different software projects) rely on the same variable (e.g. `PORT`), you'll need to make sure that _both_ `$USER.env` files set that variable, or that _neither_ do. Otherwise, you'll get unexpected behaviour. **TL;DR:** When in doubt, re-initialize all state in each `$USER.env` file.

## Installation

Assuming you have Oh-my-zsh installed, you should be able to install `userenv` like any other zsh plugin. (In particular, notice that the `git clone` line specifies a different target directory, `userenv`, than what would be the default, `userenv-zsh`.)

```
cd ~/.oh-my-zsh/plugins
git clone https://github.com/schoonology/userenv-zsh.git userenv
```

Once the plugin is installed, you can enable it by editing your plugin list in `~.zshrc`:

```
...
plugins=(... userenv)
...
```

Once you've saved `~/.zshrc`, you'll need to reload it with `source ~/.zshrc`.

## Alternatives

Special thanks to John Hamelink, who created [env-zsh](https://github.com/johnhamelink/env-zsh), upon which this plugin is based. His plugin consistently loads a filed called `.env`, which is much simpler. However, some systems (like Docker Compose) already use `.env` for a different purpose, so I decided to use `$USER.env` instead.
