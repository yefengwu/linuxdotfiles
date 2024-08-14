# Installation

```bash
chezmoi init https://github.com/yefengwu/linuxdotfiles.git
chezmoi apply
chezmoi age decrypt --output "${HOME}/.config/chezmoi/key.txt" --passphrase "~/.local/share/chezmoi/key.txt.age"
chezmoi apply
```
