# Dotfiles Project

This is a personal dotfiles repository containing development environment configurations.

- **Neovim** - Editor configuration in `nvim/`
- **Zsh** - Shell configuration in `zshrc`, `zshenv`
- **Tmux** - Terminal multiplexer configuration in `tmux.conf`
- **Just** - Bootstrap scripts in `justfile`

**WARNING**: Never run `just` commands. The `justfile` contains dangerous operations:
- Formatting and overwriting user config files (`~/.zshrc`, `~/.config/nvim`, etc.)
- Installing system dependencies via apt/brew
- Cleaning up user data (uv cache, neovim config, rustup, etc.)
- Changing login shell

Only verify prerequisites with explicit request: `just check-apps`.

## Code Style Guidelines

### General

- 2 spaces for indentation (not tabs)
- Keep lines under 100 characters
- Add comments for non-obvious decisions
- Follow the latest practices for each language/framework
- Maintain consistency with existing implementation

### Lua (Neovim)

- Use local functions over global
- Group require statements at the top
- Follow Neovim's latest practices; avoid deprecated APIs

**Format**: Run `stylua`. If not found, prompt user to install.

### Shell (Zsh/Bash)

- Use functions for reusable logic
- Quote variables
- Check exit codes for critical operations

**Format**: Run `shfmt`. **Lint**: Run `shellcheck`. If not found, prompt user to install.

**Note**: `justfile` uses tab indentation (required by just), not 2 spaces.

### Configuration Files

- **JSON**: 2 spaces, no trailing commas, double quotes
- **YAML**: 2 spaces, no tabs
- **TOML**: `kebab-case` keys, no quotes around simple values

### Git

Conventional commits:

```
feat(nvim): add new plugin for completion
fix(zsh): correct PATH variable
chore(tmux): update keybindings
```

### Naming

| Type | Convention | Example |
|------|------------|---------|
| Variables/Functions | snake_case | `my_variable` |
| Constants | UPPER_SNAKE | `MAX_BUFFER` |
| Files | kebab-case | `my-config.lua` |
| Git branches | kebab-case | `feature/add-completion` |

## Before Committing

1. Format: `stylua` (Lua), `shfmt` (Shell)
2. Lint: `shellcheck` (Shell), `typos` (all files)

If not found, check common paths: `~/.local/bin`, `~/.cargo/bin`, `~/.local/share/nvim/mason/bin`, `/usr/bin`. If still not found, prompt user to install.

## Notes

- Changes reflect personal preferences
- Bootstrap scripts may overwrite existing configurations
- Requires Nerd Font for icons