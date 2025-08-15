# Tools of choice

- xonsh
- qtile (<= i3 + polybar)
- rofi w/ rofi-emoji
- wezterm (<= kitty)
- neovim
- exa (alias ll), lsd
- prettyping + mtr + trippy
- bat (maybe moar)
- ov (pager, less)
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
- sidem - env file editor
- vifm => nnn | spf (superfile) ?
- repassh
- termscp (scp)
- croc - file transfer
- dog <= drill (<= nslookup, dig)
- fx (<= jq) - json query
- gron - json grep
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
- slides (https://github.com/maaslalani/slides) - markdown presentation
- parcellite - clipboard manager widget
- clipboard (https://github.com/Slackadays/clipboard) - custom clipboard manager
- harlequin (https://harlequin.sh/) - sql client
- lazysql - sql client
- kooha - screen recorder
- toolong - log viewer/merger
- netscanner - scan local networks
- omm - task / todo list
- lazyjournal - tui for journalctl
- jjui - tui for jj (https://github.com/idursun/jjui)
- chiko - grpc terminal client (https://github.com/felangga/chiko)
- delta - diff viewer (diff-so-fancy)
- mergiraf - context aware git (and jj) merge tool

Emojis: noto-fonts-emoji (check github, tweetdeck) or ttf-joypixels

## Arch / Manjaro

- install [yay](https://github.com/Jguer/yay)

### Check packages that are not needed:
```
$ pacman -Qdtq
```

```
yay -S neovim ripgrep fd bat tmux exa wezterm rofi-emoji glances gotop figlet lolcat
```

## Tools

Use [asdf](https://asdf-vm.com/).

### ASDF tools

- hctl - home assistant cli

## Python

- rich
- ruff
- rye
- uv (!)

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

