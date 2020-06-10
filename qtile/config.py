from libqtile.config import Key, Screen, Group, Drag, Click, Match, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.config import EzKey

from plasma import Plasma
import os


TERMINAL = os.environ.get('TERMINAL', 'kitty')


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
    # ('M-S-c', app_or_group('www', 'google-chrome')),
    # ('M-c', lazy.spawn('google-chrome')),
    ('M-S-c', app_or_group('www', 'ff')),
    ('M-c', lazy.spawn('ff')),
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
    # ('M-S-c', app_or_group('www', 'google-chrome')),
    ('M-S-c', app_or_group('www', 'ff')),
    # ('M-c', lazy.spawn('google-chrome')),
    ('M-c', lazy.spawn('ff')),
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
    ('M-C-t', lazy.layout.grow_down(), lazy.layout.decrease_nmaster(), lazy.layout.grow_height(-30)),  # dvorak j
    ('M-C-n', lazy.layout.grow_up(), lazy.layout.increase_nmaster(), lazy.layout.grow_height(30)),  # dvorak k
    ('M-C-s', lazy.layout.grow_right(), lazy.layout.increase_ratio(), lazy.layout.grow_width(30)),  # dvorak l

    ('M-h', lazy.layout.left(), lazy.layout.previous()),  # h
    ('M-t', lazy.layout.down()),  # j
    ('M-n', lazy.layout.up()),  # k
    ('M-s', lazy.layout.right(), lazy.layout.next()),  # l

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
          matches=[Match(wm_class=[
              'Navigator',
              'firefoxdeveloperedition',
              'google-chrome',
              'google-chrome-unstable',
              'Google-chrome'])]),
    Group('steam', layout='max', persist=False, init=False, screen_affinity=1,
          matches=[Match(wm_class=['Steam', 'steam'])]),
    Group('gimp', layout='max', persist=False, init=False, screen_affinity=1,
          matches=[Match(wm_class=['gimp', 'Gimp'])]),
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
    border_focus='#008080',
    border_normal='#808080',
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

screens = [
    Screen(
        top=bar.Bar([
            widget.WindowName(width=bar.CALCULATED, background="#880000"),
            widget.TextBox("", foreground="#880000", padding=0, fontsize=20),
            widget.Spacer(),
            widget.TextBox("", foreground="#880000", padding=0, fontsize=20),
            widget.CurrentLayout(background="#880000"),
        ], 24),
        bottom=bar.Bar([
            widget.GroupBox(urgent_alert_method='text'),
            widget.Spacer(),
            # widget.Notify(foreground="ffff44"),
            widget.Volume(**widget_defaults),
            widget.CPUGraph(
                graph_color='18EB18',
                fill_color='16EB16.3',
                line_width=1),
            widget.MemoryGraph(
                graph_color='EBE618',
                fill_color='EBE616.3',
                line_width=1),
            widget.NetGraph(
                graph_color='18BAEB',
                fill_color='1667EB.3',
                line_width=1),
            widget.Net(interface="eth0"),
            widget.Clock(format='%Y.%m.%d %H:%M:%S'),
            widget.Systray(),
        ], 30),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.WindowName(),
                widget.CurrentLayout(),
            ],
            24,
        ),
        bottom=bar.Bar([
            widget.GroupBox(urgent_alert_method='text'),
            widget.Spacer(),
            widget.Clock(format='%Y.%m.%d %H:%M:%S'),
        ], 30),
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

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(**layout_cfg)
auto_fullscreen = True

wmname = "LG3D"
