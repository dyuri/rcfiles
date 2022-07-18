from libqtile.config import Key, Screen, Group, Drag, Click, Match, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import qtile, layout, bar, widget, hook
from libqtile.config import EzKey
from mpris2widget import Mpris2

from plasma import Plasma
from qtools.xresources import get as get_resources
import qtools.focus
import os
import psutil

COLORS = {
    "color0": "#282828",
    "color1": "#cc241d",
    "color2": "#98971a",
    "color3": "#d79921",
    "color4": "#458588",
    "color5": "#b16286",
    "color6": "#689d6a",
    "color7": "#a89984",
    "color8": "#928374",
    "color9": "#fb4934",
    "color10": "#b8bb26",
    "color11": "#fabd2f",
    "color12": "#83a598",
    "color13": "#d3869b",
    "color14": "#8ec07c",
    "color15": "#ebdbb2",
    # gruvbox extra
    "colord0h": "#1d2021",
    "colord0": "#282828",
    "colord0s": "#32302f",
    "colord1": "#3c3836",
    "colord2": "#504945",
    "colord3": "#665c54",
    "colord4": "#7c6f64",
    "colorl0h": "#f9f5d7",
    "colorl0": "#fbf1c7",
    "colorl0s": "#f2e5bc",
    "colorl1": "#ebdbb2",
    "colorl2": "#d5c4a1",
    "colorl3": "#bdae93",
    "colorl4": "#a89984",
    # repa extra
    "colorrg": "#8bc34a",
    "colorrr": "#e91e63",
    "colorryg": "#afdf00",
    "colorrgy": "#cddc39",
}
COLORS.update({key: value for key, value in get_resources().items() if key.startswith("color")})
TERMINAL = os.environ.get('TERMINAL', 'kitty')


def color(num, alpha=None, fallback="#888888"):
    alphav = f".{alpha}" if alpha is not None else ""
    col = COLORS.get(f"color{num}", fallback)
    return f"{col}{alphav}"

def window_to_prev_group():
    @lazy.function
    def __inner(qtile):
        i = qtile.groups.index(qtile.current_group)

        if qtile.current_window and i != 0:
            group = qtile.groups[i - 1].name
            qtile.current_window.togroup(group)
    return __inner


def window_to_next_group():
    @lazy.function
    def __inner(qtile):
        i = qtile.groups.index(qtile.current_group)

        if qtile.current_window and i != len(qtile.groups):
            group = qtile.groups[i + 1].name
            qtile.current_window.togroup(group)
    return __inner


def to_prev_used_group():
    @lazy.function
    def __inner(qtile):
        i = qtile.groups.index(qtile.current_group)
        gl = len(qtile.groups)
        to = i - 1 % gl

        while i != to and not qtile.groups[to].windows:
            to -= 1

        if i != to:
            qtile.groups[to].cmd_toscreen()

    return __inner


def to_next_used_group():
    @lazy.function
    def __inner(qtile):
        i = qtile.groups.index(qtile.current_group)
        gl = len(qtile.groups)
        to = i + 1 % gl

        while i != to and not qtile.groups[to].windows:
            to += 1

        if i != to:
            qtile.groups[to].cmd_toscreen()

    return __inner


def app_or_group(group, app):
    @lazy.function
    def __inner(qtile):
        if qtile.groups_map[group].windows:
            # TODO debug
            qtile.groups_map[group].cmd_toscreen()
        else:
            qtile.groups_map[group].cmd_toscreen()
            qtile.cmd_spawn(app)
    return __inner


mod = "mod4"

keymap_ansi = [
    ('M-S-c', app_or_group('www', 'google-chrome')),
    ('M-c', lazy.spawn('google-chrome')),
    # ('M-S-c', app_or_group('www', 'ff')),
    # ('M-c', lazy.spawn('ff')),
    ('M-<Return>', lazy.spawn(TERMINAL)),
    ('M-<Escape>', lazy.spawn("rofi -show run")),
    ('M-S-<Escape>', lazy.spawn("rofi -show emoji")),
    ('M-<Tab>', lazy.spawn("rofi -combi-modi window,run -show combi -modi combi,run,window,emoji")),
    ('A-C-l', lazy.spawn('i3lock -i sajat/bg.png -c 000000')),

    ('M-C-r', lazy.restart()),

    ('M-<BackSpace>', lazy.layout.rotate()),
    ('M-S-<space>', lazy.layout.toggle_split()),
    ('M-A-<space>', lazy.next_layout()),

    ('M-f', lazy.window.toggle_fullscreen()),
    ('M-S-f', lazy.window.toggle_floating()),
    ('M-C-f', lazy.window.bring_to_front()),
    ('M-<grave>', lazy.window.bring_to_front()),

    ('M-<Left>', to_prev_used_group()),
    ('M-<Right>', to_next_used_group()),
    ('M-C-<Left>', lazy.screen.prev_group()),
    ('M-C-<Right>', lazy.screen.next_group()),
    ('M-S-<Left>', window_to_prev_group()),
    ('M-S-<Right>', window_to_next_group()),
    ('M-A-<Left>', lazy.prev_screen()),
    ('M-A-<Right>', lazy.next_screen()),
    ('A-<Tab>', lazy.group.next_window()),
    ('A-S-<Tab>', lazy.group.prev_window()),
    ('M-w', lazy.window.kill()),

    ('M-C-h', lazy.layout.grow_left(), lazy.layout.decrease_ratio(), lazy.layout.grow_width(-30)),  # dvorak h
    ('M-C-j', lazy.layout.grow_down(), lazy.layout.decrease_nmaster(), lazy.layout.grow_height(-30)),  # dvorak j
    ('M-C-k', lazy.layout.grow_up(), lazy.layout.increase_nmaster(), lazy.layout.grow_height(30)),  # dvorak k
    ('M-C-l', lazy.layout.grow_right(), lazy.layout.increase_ratio(), lazy.layout.grow_width(30)),  # dvorak l

    ('M-h', lazy.layout.left(), lazy.layout.previous()),  # h
    ('M-j', lazy.layout.down()),  # j
    ('M-k', lazy.layout.up()),  # k
    ('M-l', lazy.layout.right(), lazy.layout.next()),  # l

    ('M-S-h', lazy.layout.move_left(), lazy.layout.shuffle_left()),  # h
    ('M-S-j', lazy.layout.move_down(), lazy.layout.shuffle_down()),  # j
    ('M-S-k', lazy.layout.move_up(), lazy.layout.shuffle_up()),  # k
    ('M-S-l', lazy.layout.move_right(), lazy.layout.shuffle_right()),  # l

    ('M-A-h', lazy.layout.integrate_left(), lazy.layout.flip_left()),  # h
    ('M-A-j', lazy.layout.integrate_down(), lazy.layout.flip_down()),  # j
    ('M-A-k', lazy.layout.integrate_up(), lazy.layout.flip_up()),  # k
    ('M-A-l', lazy.layout.integrate_right(), lazy.layout.flip_right()),  # l

    ('M-u', lazy.layout.mode_horizontal()),
    ('M-i', lazy.layout.mode_vertical()),
    ('M-C-u', lazy.layout.mode_horizontal_split()),
    ('M-C-i', lazy.layout.mode_vertical_split()),

    ('M-C-5', lazy.layout.size(500)),
    ('M-C-8', lazy.layout.size(800)),
    ('M-C-0', lazy.layout.reset_size()),

    ('M-<bracketleft>', lazy.spawn('playerctl play-pause')),
    ('M-<bracketright>', lazy.spawn('playerctl next')),
]

keymap_dox = [
    ('M-S-c', app_or_group('www', 'google-chrome')),
    # ('M-S-c', app_or_group('www', 'ff')),
    ('M-c', lazy.spawn('google-chrome')),
    # ('M-c', lazy.spawn('ff')),
    ('M-<Return>', lazy.spawn(TERMINAL)),
    ('M-<Escape>', lazy.spawn("rofi -show run")),
    ('M-S-<Escape>', lazy.spawn("rofi -show emoji")),
    ('M-<Tab>', lazy.spawn("rofi -combi-modi window,run -show combi -modi combi,run,window,emoji")),
    ('A-C-l', lazy.spawn('i3lock -i sajat/bg.png -c 000000')),

    ('M-C-r', lazy.restart()),

    ('M-<BackSpace>', lazy.layout.rotate()),
    ('M-S-<space>', lazy.layout.toggle_split()),
    ('M-A-<space>', lazy.next_layout()),

    ('M-f', lazy.window.toggle_fullscreen()),
    ('M-S-f', lazy.window.toggle_floating()),
    ('M-C-f', lazy.window.bring_to_front()),
    ('M-<grave>', lazy.window.bring_to_front()),

    ('M-<Left>', to_prev_used_group()),
    ('M-<Right>', to_next_used_group()),
    ('M-C-<Left>', lazy.screen.prev_group()),
    ('M-C-<Right>', lazy.screen.next_group()),
    ('M-S-<Left>', window_to_prev_group()),
    ('M-S-<Right>', window_to_next_group()),
    ('M-A-<Left>', lazy.prev_screen()),
    ('M-A-<Right>', lazy.next_screen()),
    ('A-<Tab>', lazy.group.next_window()),
    ('A-S-<Tab>', lazy.group.prev_window()),
    ('M-w', lazy.window.kill()),
    ('M-C-q', lazy.shutdown()),

    ('M-C-h', lazy.layout.grow_left(), lazy.layout.decrease_ratio(), lazy.layout.grow_width(-30)),  # dvorak h
    ('M-C-t', lazy.layout.grow_down(), lazy.layout.decrease_nmaster(), lazy.layout.grow_height(-30)),  # dvorak j
    ('M-C-n', lazy.layout.grow_up(), lazy.layout.increase_nmaster(), lazy.layout.grow_height(30)),  # dvorak k
    ('M-C-s', lazy.layout.grow_right(), lazy.layout.increase_ratio(), lazy.layout.grow_width(30)),  # dvorak l

    # ('M-h', lazy.layout.left(), lazy.layout.previous()),  # h
    # ('M-t', lazy.layout.down()),  # j
    # ('M-n', lazy.layout.up()),  # k
    # ('M-s', lazy.layout.right(), lazy.layout.next()),  # l
    ('M-h', lazy.function(qtools.focus.left)),  # h
    ('M-t', lazy.function(qtools.focus.down)),  # j
    ('M-n', lazy.function(qtools.focus.up)),  # k
    ('M-s', lazy.function(qtools.focus.right)),  # l

    ('M-S-h', lazy.layout.move_left(), lazy.layout.shuffle_left()),  # h
    ('M-S-t', lazy.layout.move_down(), lazy.layout.shuffle_down()),  # j
    ('M-S-n', lazy.layout.move_up(), lazy.layout.shuffle_up()),  # k
    ('M-S-s', lazy.layout.move_right(), lazy.layout.shuffle_right()),  # l

    ('M-A-h', lazy.layout.integrate_left(), lazy.layout.flip_left()),  # h
    ('M-A-t', lazy.layout.integrate_down(), lazy.layout.flip_down()),  # j
    ('M-A-n', lazy.layout.integrate_up(), lazy.layout.flip_up()),  # k
    ('M-A-s', lazy.layout.integrate_right(), lazy.layout.flip_right()),  # l

    ('M-y', lazy.layout.mode_horizontal()),
    ('M-p', lazy.layout.mode_vertical()),
    ('M-C-y', lazy.layout.mode_horizontal_split()),
    ('M-C-p', lazy.layout.mode_vertical_split()),

    ('M-C-5', lazy.layout.size(500)),
    ('M-C-8', lazy.layout.size(800)),
    ('M-C-0', lazy.layout.reset_size()),

    ('M-<bracketleft>', lazy.spawn('playerctl play-pause')),
    ('M-<bracketright>', lazy.spawn('playerctl next')),
]

keymap = keymap_dox
keys = [EzKey(*v) for v in keymap]

groups = [Group(str(i+1)) for i in range(9)]

for idx, g in enumerate(groups):
    # mod1 + letter of group = switch to group
    keys.append(
        Key([mod], str(idx + 1), lazy.group[g.name].toscreen())
    )

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], str(idx + 1), lazy.window.togroup(g.name))
    )

groups.extend([
    Group('www', layout='plasma', persist=True, init=True, screen_affinity=1,
          matches=[
              Match(wm_class='Navigator'),
              Match(wm_class='firefoxdeveloperedition'),
              Match(wm_class='google-chrome'),
              Match(wm_class='google-chrome-unstable'),
              Match(wm_class='Google-chrome')]),
    Group('steam', layout='max', persist=False, init=False, screen_affinity=1,
          matches=[Match(wm_class='Steam'), Match(wm_class='steam')]),
    Group('gimp', layout='max', persist=False, init=False, screen_affinity=1,
          matches=[Match(wm_class='gimp'), Match(wm_class='Gimp')]),
])

# keys for www group
keys.append(EzKey('M-0', lazy.group['www'].toscreen()))
keys.append(EzKey('M-S-0', lazy.window.togroup('www')))

scratchpad_config = {
    "height": 0.465,
    "y_position": 0.1,
    "warp_pointer": False,
    "on_focus_lost_hide": True,
    "opacity": .8,
}

# scratchpads
groups.extend([
    ScratchPad("SPD",
            dropdowns=[
                DropDown("term",
                    TERMINAL + " --name dropdown",
                    **scratchpad_config),
                DropDown("music",
                    TERMINAL + " --name music tuijam",
                    **scratchpad_config),
            ])
])

# keys for scratchpads
keys.append(EzKey('M-<Down>', lazy.group['SPD'].dropdown_toggle("term")))
keys.append(EzKey('M-m', lazy.group['SPD'].dropdown_toggle("music")))

layout_cfg = dict(
    border_focus='#79740e',
    border_normal='#282828',
    border_width=1,
    border_width_single=0,
    margin=10,
    margin_single=0,
)

layouts = [
    Plasma(**layout_cfg),
    # layout.Bsp(**layout_cfg),  # I prefer Plasma
    layout.Tile(**layout_cfg),
    layout.Max(),
]

widget_defaults = dict(
    font='MesloLGS Nerd Font',
    fontsize=14,
    padding=3,
)

groupbox_config = dict(
    urgent_alert_method='text',
    highlight_method="line",
    highlight_color=[color(6), color(14)],
    urgent_text=color(11),
    active=color("l0h"),
    borderwidth=3,
    rounded=False,
    padding=5,
    this_screen_border=color(14),
    this_current_screen_border=color(14),
    other_screen_border=color(0),
    other_current_screen_border=color(0),
    background=color(6),
    foreground=color(0),
)

screens = [
    Screen(
        # top=bar.Bar([
        #     widget.WindowName(width=bar.CALCULATED, background=color(6), foreground=color("d0h"), **widget_defaults),
        #     widget.TextBox("", foreground=color(6), background=color(0), padding=0, fontsize=21),
        #     widget.Spacer(background=color(0)),
        #     widget.TextBox("", background=color(0), foreground=color("d3"), padding=0, fontsize=21),
        #     widget.CurrentLayout(background=color("d3"), foreground=color(0), **widget_defaults),
        # ], 25, margin=10),
        bottom=bar.Bar([
            widget.GroupBox(**groupbox_config),
            widget.TextBox("", foreground=color(6), background=color(0) + "00", padding=0, fontsize=25),
            widget.Spacer(background=color(0) + "00"),
            widget.TextBox("", background=color(0) + "00", foreground=color("d1"), padding=0, fontsize=21),
            widget.TextBox("墳", background=color("d1"), foreground=color(3)),
            widget.Volume(**widget_defaults, background=color("d1"), foreground=color("d4"), cardid=0, channel="PCM", device="sysdefault:0"),
            widget.TextBox("", background=color("d1"), foreground=color("d2"), padding=0, fontsize=21),
            widget.CPUGraph(
                graph_color=color(10),
                fill_color=color(10, 5),
                background=color("d2"),
                border_width=0,
                margin_x=1,
                margin_y=2,
                line_width=1),
            widget.MemoryGraph(
                graph_color=color(11),
                fill_color=color(11, 5),
                background=color("d2"),
                border_width=0,
                margin_x=1,
                margin_y=2,
                line_width=1),
            widget.NetGraph(
                graph_color=color(12),
                fill_color=color(12, 3),
                background=color("d2"),
                border_width=0,
                margin_x=1,
                margin_y=2,
                line_width=1),
            widget.TextBox("", background=color("d2"), foreground=color("d3"), padding=0, fontsize=21),
            widget.Clock(format='%Y.%m.%d %H:%M:%S', **widget_defaults, background=color("d3"), foreground=color(11)),
            widget.Systray(background=color("d3")),
        ], 29, background="#28282800", margin=10),
    ),
    Screen(
        # top=bar.Bar([
        #     widget.WindowName(width=bar.CALCULATED, background=color(6), foreground=color("d0h"), **widget_defaults),
        #     widget.TextBox("", foreground=color(6), background=color(0), padding=0, fontsize=21),
        #     widget.Spacer(background=color(0)),
        #     widget.TextBox("", background=color(0), foreground=color("d3"), padding=0, fontsize=21),
        #     widget.CurrentLayout(background=color("d3"), foreground=color(0), **widget_defaults),
        # ], 25, margin=10),
        bottom=bar.Bar([
            widget.GroupBox(**groupbox_config),
            widget.TextBox("", foreground=color(6), background=color(0) + "00", padding=0, fontsize=25),
            widget.Spacer(background=color(0) + "00"),
            widget.TextBox("", background=color(0) + "00", foreground=color("d1"), padding=0, fontsize=21),
            widget.TextBox("墳", background=color("d1"), foreground=color(3)),
            widget.Volume(**widget_defaults, background=color("d1"), foreground=color("d4"), cardid=2, channel="PCM", device="sysdefault:2"),
            # Mpris2(
            #     name="chrome",
            #     **widget_defaults,
            #     objname="org.mpris.MediaPlayer2.chrome",
            #     display_metadata=['xesam:title', 'xesam:artist'],
            #     stop_pause_text='',
            #     background=color("d1"),
            #     foreground=color(2)),
            widget.TextBox("", background=color("d1"), foreground=color("d3"), padding=0, fontsize=21),
            widget.Clock(format='%Y.%m.%d %H:%M:%S', **widget_defaults, background=color("d3"), foreground=color(11)),
        ], 29, background="#28282828", margin=10),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button2", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button3", lazy.window.bring_to_front())
]


@hook.subscribe.client_new
def dialogs(window):
    if(window.window.get_wm_type() == 'dialog'
       or window.window.get_wm_transient_for()
       or not window.window.get_wm_class()
       or 'gmrun' in window.window.get_wm_class()
       or 'emulator64-arm' in window.window.get_wm_class()):
        window.floating = True


@hook.subscribe.screen_change
def restart_on_randr(ev):
    global _first_screen_change
    if _first_screen_change:
        _first_screen_change = False
    else:
        qtile.cmd_restart()


# @hook.subscribe.client_new
def _swallow(window):
    pid = window.window.get_net_wm_pid()
    ppid = psutil.Process(pid).ppid()
    cpids = {c.window.get_net_wm_pid(): wid for wid, c in window.qtile.windows_map.items()}
    for _ in range(5):
        if not ppid:
            return
        if ppid in cpids:
            parent = window.qtile.windows_map.get(cpids[ppid])
            parent.minimized = True
            window.parent = parent
            return
        ppid = psutil.Process(ppid).ppid()


# @hook.subscribe.client_killed
def _unswallow(window):
    if hasattr(window, 'parent'):
        window.parent.minimized = False


_first_screen_change = True
dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(**layout_cfg)
auto_fullscreen = True

# wmname = "LG3D"
