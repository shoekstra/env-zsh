# Env zsh plugin

This plugin automatically loads any environment variables in any file called `.env` when it exists in the current working directory. This plugin will load `.env` in two situations:

- When the shell first starts (e.g. you open a new window or tab).
- When you change the current working directory.

There's a caveat: because this plugin uses `source`, any changes you make will persist for as long as the shell is alive. For example, if two directories (e.g. two different software projects) rely on the same variable (e.g. `PORT`), you'll need to make sure that _both_ `.env` files set that variable, or that _neither_ do. Otherwise, you'll get unexpected behaviour. **TL;DR:** When in doubt, re-initialize all state in each `.env` file.

## Installation

Assuming you have Oh-my-zsh installed, you should be able to install `env` like any other zsh plugin. (In particular, notice that the `git clone` line specifies a different target directory, `env`, than what would be the default, `env-zsh`.)

```
cd ~/.oh-my-zsh/plugins
git clone https://github.com/shoekstra/env-zsh.git env
```

Once the plugin is installed, you can enable it by editing your plugin list in `~.zshrc`:

```
...
plugins=(... env)
...
```

Once you've saved `~/.zshrc`, you'll need to reload it with `source ~/.zshrc`.

## Thanks

Special thanks to John Hamelink, who created [env-zsh](https://github.com/johnhamelink/env-zsh), and Michael Schoonmaker, who created [userenv-zsh](https://github.com/Schoonology/userenv-zsh), upon which this plugin is based.
