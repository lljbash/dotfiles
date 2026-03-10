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

## After Making Changes
- Lua files: run `stylua`
- Shell scripts: run `shfmt` and `shellcheck`
- Check typos by yourself

If a tool is not found, check `~/.local/share/nvim/mason/bin`. If still not found, ask me to install it.

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
