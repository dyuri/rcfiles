# Tools of choice

- xonsh
- qtile (<= i3 + polybar)
- rofi w/ rofi-emoji
- wezterm (<= kitty)
- neovim
- exa (alias ll), lsd
- prettyping + mtr + trippy
- bat (maybe moar)
- tmux => ? zellij
- fzf
- fd
- rg (<= ag)
- mpv (<= mplayer)
- httpie => xh, httpx[cli]
- duf (<= df)
- dust, erdtree (<= du)
- procs (<= ps)
- gotop/bottom/glances (<= htop)
- powerline
- neofetch
- wpgtk (<= pywal)
- flameshot
- chafa
- msgcat --color=test
- wuzz
- hyperfine - time
- vhs (programmed) OR asciinema + svg-term-cli OR terminalizer
- pastel (https://github.com/sharkdp/pastel) -> repacolors
- direnv
- vifm => nnn
- repassh
- termscp (scp)
- croc - file transfer
- dog <= drill (<= nslookup, dig)
- jq => fx - json query
- jc - json convert
- bitwise - bitwise calculator
- theme.sh
- uni - unicode query
- marktext - (typora isn't free anymore) - markdown editor
- glow - markdown reader
- hexyl - colored hex viewer (imhex is the ultimate tool, but it's an overkill)
- fq - jq for binary files
- lg (lazygit) (<= gitui)
- podman (<= docker)
- hetty - debug HTTP MITM proxy
- tproxy - tcp MITM proxy
- codext - encoding/decoding whatever
- systeroid (<= sysctl)
- sampler, wtfutil - text dashboard
- mprocs - multi process runner
- ali - http performance
- gomuks - matrix client
- viddy - watch alternative
- visidata - data visualisation
- lnav - log navigator/viewer
- caddy - `python -m http.server` replacement
- bandwhich - bandwidth monitor
- gpxsee, routeconverter - GPX view / edit
- ttyd - share terminal over web
- andcli - (+ aegis) 2FA TOTP
- popsicle - pendrive iso
- slides (https://github.com/maaslalani/slides) - md presentation
- parcellite - clipboard manager widget
- clipboard (https://github.com/Slackadays/clipboard) - custom clipboard manager

Emojis: noto-fonts-emoji (check github, tweetdeck) or ttf-joypixels

## Arch / Manjaro

- install [pikaur](https://github.com/actionless/pikaur)

### Check packages that are not needed:
```
$ pacman -Qdtq
```

```
pikaur -S neovim ripgrep fd bat tmux exa wezterm rofi-emoji glances gotop figlet lolcat
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

