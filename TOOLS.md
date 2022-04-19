# Tools of choice

- xonsh
- qtile (<= i3 + polybar)
- rofi w/ rofi-emoji
- kitty
- neovim
- exa (alias ll), lsd
- prettyping + mtr
- bat
- tmux => ? zellij
- fzf
- fd
- rg (<= ag)
- mpv (<= mplayer)
- httpie => xh, httpx[cli]
- duf (<= df)
- procs (<= ps)
- gotop/glances (<= htop)
- powerline
- neofetch
- wpgtk (<= pywal)
- flameshot
- chafa
- msgcat --color=test
- wuzz
- hyperfine
- asciinema + svg-term-cli OR terminalizer
- pastel (https://github.com/sharkdp/pastel) -> repacolors
- direnv
- vifm => nnn
- repassh
- croc - file transfer
- drill (<= nslookup, dig)
- jq => fx - json query
- jc - json convert
- bitwise - bitwise calculator
- theme.sh
- uni - unicode query
- marktext - (typora isn't free anymore) - markdown editor
- hexyl - colored hex viewer
- fq - jq for binary files
- lg (lazygit) (<= gitui)
- podman (<= docker)
- hetty - debug MITM proxy
- codext - encoding/decoding whatever
- systeroid (<= sysctl)

Emojis: noto-fonts-emoji (check github, tweetdeck) or ttf-joypixels

## Arch / Manjaro

- install [pikaur](https://github.com/actionless/pikaur)

```
pikaur -S neovim ripgrep fd bat tmux exa kitty rofi-emoji glances gotop figlet lolcat
```

## Python

- rich

## Notes

- use `pipx` for python tools
- except for `poetry`, use the official install method there

## Video interpolation

```
ffmpeg \
  -i input.mp4 \
  -crf 10 \
  -vf "minterpolate=fps=60:mi_mode=mci:mc_mode=aobmc:me_mode=bidir:vsbmc=1" \
  output.60fps.mp4
```

