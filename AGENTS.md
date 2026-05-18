# Dotfiles

Personal development environment configs:
- Neovim (`nvim/`)
- Zsh (`zshrc`, `zshenv`)
- Tmux (`tmux.conf`)
- Just (`justfile`)

---

# Rules You Must Follow

- You MUST use `question` tool to ask questions if you are unsure about something
- Prefer use `question` tool over asking me directly
- Never guess or assume anything without asking
- Never run `just` commands (dangerous: overwrites configs, installs deps, cleans user data)
- Don't commit or push unless I ask
- When debugging issues, verify your assumptions with logs before making fixes. Don't assume you know the root cause without evidence.

## After Making Changes
- Lua files: run `stylua`
- Shell scripts: run `shfmt` and `shellcheck`
- Check typos by yourself

If a tool is not found, check `~/.local/share/nvim/mason/bin`. If still not found, ask me to install it.

## Neovim Config Workflow
- Config source of truth is `nvim/` in this repo, deployed to `~/.config/nvim` via `just install-nvim-configs`
- After editing files in `nvim/`, remind the user to run `just install-nvim-configs` before testing
- To test plugin changes: user runs `just install-nvim-configs`, then `nvim --headless "+Lazy! sync" +qa`
- lazy.nvim: `init` runs **before** plugin load (use for pure vim options); `config` runs **after** (use for anything that depends on the plugin being loaded)

---

# Code Style (Reference)

## General
- 2 spaces for indentation
- Keep lines under 100 characters
- Be consistent with existing codebase (naming, style, etc.)
- Use latest practices; avoid deprecated methods
- Add comments for non-obvious decisions

## Commit Messages
Use Conventional Commits:
```
feat(nvim): add new plugin for completion
fix(zsh): correct PATH variable
chore(tmux): update keybindings
```
