# -*- coding: utf-8 -*-
from libqtile.manager import Key, Click, Drag, Screen, Group
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.dgroups import DGroups, Match, simple_key_binder

from libqtile import xcbq
xcbq.keysyms["XF86AudioRaiseVolume"] = 0x1008ff13
xcbq.keysyms["XF86AudioLowerVolume"] = 0x1008ff11
xcbq.keysyms["XF86AudioMute"] = 0x1008ff12

widget_defaults = dict(
    font = 'Inconsolata-g',
    fontsize = 14,
    padding = 3,
)


def app_or_group(group, app):
    """ Go to specified group if it exists. Otherwise, run the specified app.
    When used in conjunction with dgroups to auto-assign apps to specific
    groups, this can be used as a way to go to an app if it is already
    running. """
    def f(qtile):
        try:
            qtile.groupMap[group].cmd_toscreen()
        except KeyError:
            qtile.cmd_spawn(app)
    return f

def getIndex(currentGroupName):
    for i in xrange(len(groups)):
        if groups[i].name == currentGroupName:
            return i

def toPrevGroup(qtile):
    currentGroup = qtile.currentGroup.name
    i = getIndex(currentGroup)
    qtile.currentWindow.togroup(groups[ (i - 1) % len(groups)].name)

def toNextGroup(qtile):
    currentGroup = qtile.currentGroup.name
    i = getIndex(currentGroup)
    qtile.currentWindow.togroup(groups[ (i + 1) % len(groups)].name)


mod = "mod4"
alt = "mod1"

keys = [
    Key(
        [mod, "control"],  "r",
        lazy.restart()
    ),
    Key(
        [mod], "w",
        lazy.window.kill()
    ),
    Key(
        [alt], "Tab",
        lazy.group.next_window()
    ),
    Key(
        [alt, "shift"], "Tab",
        lazy.group.prev_window()
    ),
    # this is usefull when floating windows get buried
    Key(
        [alt], "grave",
        lazy.window.bring_to_front()
    ),
    # group switch
    Key(
        [mod], "Left",
        lazy.group.prevgroup()
    ),
    Key(
        [mod], "Right",
        lazy.group.nextgroup()
    ),
    Key(
        [mod, "shift"], "Left",
        lazy.function(toPrevGroup)
    ),
    Key(
        [mod, "shift"],
        "Right",
        lazy.function(toNextGroup)
    ),
    # layouts
    Key(
        [mod, "shift"], "m",
        lazy.group.setlayout('max')
    ),
    Key(
        [mod, "shift"], "s",
        lazy.group.setlayout('stack')
    ),
    Key(
        [mod, "shift"], "t",
        lazy.group.setlayout('tile')
    ),
    Key(
        [mod, "shift"], "r",
        lazy.group.setlayout('ratiotile')
    ),
    Key(
        [mod, "shift"], "x",
        lazy.group.setlayout('xmonad-tall')
    ),
    Key([mod], "space",
        lazy.nextlayout()
    ),
    # Bindings to control the layouts
    Key(
        [mod], "h",
        lazy.layout.previous()
    ),
    Key(
        [mod], "l",
        lazy.layout.next()
    ),
    Key(
        [mod], "j",
        lazy.layout.up()
    ),
    Key(
        [mod], "k",
        lazy.layout.down()
    ),
    Key(
        [mod], "f",
        lazy.window.toggle_floating()
    ),
    Key(
        [mod], "F12",
        lazy.window.toggle_fullscreen()
    ),
    # These are unique to stack layout
    Key(
        [mod, "shift"], "l",
        lazy.layout.client_to_next()
    ),
    Key(
        [mod, "shift"], "h",
        lazy.layout.client_to_previous()
    ),
    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split()
    ),
    # Multiple function keys
    Key(
        [mod, "shift"], "space",
        lazy.layout.rotate(),
        lazy.layout.flip(),              # xmonad-tall
    ),
    Key(
        [mod, "shift"], "k",
        lazy.layout.shuffle_up(),         # Stack, xmonad-tall
       ),
    Key(
        [mod, "shift"], "j",
        lazy.layout.shuffle_down(),       # Stack, xmonad-tall
       ),
    Key(
        [mod, "control"], "l",
        lazy.layout.add(),                # Stack
        lazy.layout.increase_ratio(),     # Tile
        lazy.layout.maximize(),           # xmonad-tall
       ),
    Key(
        [mod, "control"], "h",
        lazy.layout.delete(),             # Stack
        lazy.layout.decrease_ratio(),     # Tile
        lazy.layout.normalize(),          # xmonad-tall
       ),
    Key(
        [mod, "control"], "k",
        lazy.layout.shrink(),             # xmonad-tall
        lazy.layout.decrease_nmaster(),   # Tile
       ),
    Key(
        [mod, "control"], "j",
        lazy.layout.grow(),               # xmonad-tall
        lazy.layout.increase_nmaster(),   # Tile
       ),
    # applications
    Key(
        [mod], "Escape",
        lazy.spawncmd()
    ),
    Key(
        [mod], "Return",
        lazy.spawn(
        "/usr/bin/urxvt"
        " -fn 'xft:inconsolata\\-g:pixelsize=13:antialias=true:hinting=true'"
        " -fb 'xft:inconsolata\\-g:pixelsize=13:antialias=true:hinting=true'"
        )
    ),
    Key(
        [mod], "p",
        lazy.function(app_or_group('io', 'pidgin'))
    ),
    Key(
        [mod], "g",
        lazy.function(app_or_group('gimp', 'gimp'))
    ),
    Key(
        [mod], "c",
        lazy.function(app_or_group('www', 'google-chrome'))
    ),
    Key(
        [alt], "Escape",
        lazy.spawn("gmrun")
    ),
    Key(
        [mod], "q",
        lazy.spawn('xlock')
    ),
]

keys_old = [
    Key([mod], "j",
        lazy.layout.down()),
    Key([mod], "k",
        lazy.layout.up()),
    Key([mod, "shift"], "j",
        lazy.layout.move_down()),
    Key([mod, "shift"], "k",
        lazy.layout.move_up()),
    Key([mod, "control"], "j",
        lazy.layout.section_down()),
    Key([mod, "control"], "k",
        lazy.layout.section_up()),
    Key([mod], "h",
        lazy.layout.collapse_branch()),  # for tree layout
    Key([mod], "l",
        lazy.layout.expand_branch()),  # for tree layout
    Key([mod, "shift"], "h",
        lazy.layout.move_left()),
    Key([mod, "shift"], "l",
        lazy.layout.move_right()),
    Key([mod, "control"], "l",
        lazy.layout.increase_ratio()),
    Key([mod, "control"], "h",
        lazy.layout.decrease_ratio()),
    Key([mod], "comma",
        lazy.layout.increase_nmaster()),
    Key([mod], "period",
        lazy.layout.decrease_nmaster()),
    Key([mod], "Tab",
        lazy.group.next_window()),
    Key([mod, "shift"], "Tab",
        lazy.group.prev_window()),
    Key([mod, "shift"], "Return",
        lazy.layout.rotate()),
    Key([mod, "shift"], "space",
        lazy.layout.toggle_split()),

    Key([mod], "space",
        lazy.nextlayout()),
    Key([mod], "x",
        lazy.window.kill()),
    Key([mod], "t",
        lazy.window.disable_floating()),
    Key([mod, "shift"], "t",
        lazy.window.enable_floating()),
    Key([mod], "r", lazy.spawncmd()),
    Key([mod], "g", lazy.spawn(
        "/usr/bin/urxvt"
        " -fn 'xft:inconsolata\\-g:pixelsize=13:antialias=true:hinting=true'"
        " -fb 'xft:inconsolata\\-g:pixelsize=13:antialias=true:hinting=true'"
        )),
    Key([mod], "p", lazy.function(app_or_group('io', 'pidgin'))),
    Key([mod], "c", lazy.function(app_or_group('www', 'google-chrome'))),
    Key([alt], "Escape",
        lazy.spawn("gmrun")),
    Key([mod], "q",
        lazy.spawn('xtrlock')),

    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 5%+")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 5%-")),
    Key([], "XF86AudioMute",
        lazy.spawn("amixer sset Master toggle")),
    Key(["shift"], "XF86AudioRaiseVolume",
        lazy.spawn("mpc volume +5")),
    Key(["shift"], "XF86AudioLowerVolume",
        lazy.spawn("mpc volume -5")),
    Key(["shift"], "XF86AudioMute",
        lazy.spawn("mpc toggle")),

    Key([mod], "Left",
        lazy.group.prevgroup()),
    Key([mod], "Right",
        lazy.group.nextgroup()),
    Key([mod, "shift"], "Left",
        lazy.function(toPrevGroup)),
    Key([mod, "shift"], "Right",
        lazy.function(toNextGroup)),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button2", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button3", lazy.window.bring_to_front())
]

border = dict(
    border_focus='#008080',
    border_normal='#808080',
    border_width=1,
)

layouts = [
    layout.Tile(**border),
    layout.RatioTile(**border),
    layout.MonadTall(**border),
    layout.Max(),
    layout.Stack(stacks=2, **border),

    # pidgin
    layout.Slice('left', 256, name='pidgin', role='buddy_list',
        fallback=layout.Tile(**border)),

    # gimp
    layout.Slice('left', 256, name='gimp', role='gimp-toolbox',
        fallback=layout.Slice('right', 256, role='gimp-dock',
        fallback=layout.Stack(1, **border))),
]
floating_layout = layout.Floating(auto_float_types=[
    "notification",
    "toolbar",
    "splash",
    "dialog",
], **border)

static_groups = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
groups = []

for i in static_groups:
    groups.append(Group(i))
    keys.append(
        Key([mod], i, lazy.group[i].toscreen())
    )
    keys.append(
        Key([alt], 'F'+i, lazy.group[i].toscreen())
    )
    keys.append(
        Key([mod, "shift"], i, lazy.window.togroup(i))
    )

screens = [
    Screen(
        top=bar.Bar([
            widget.WindowName(**widget_defaults),
            widget.CurrentLayout(**widget_defaults),
            widget.CPUGraph(graph_color='18EB18', fill_color='16EB16.3', line_width=1),
            widget.NetGraph(graph_color='18BAEB', fill_color='1667EB.3', line_width=1),
            widget.MemoryGraph(graph_color='EBE618', fill_color='EBE616.3', line_width=1),
            widget.SwapGraph(graph_color='EB1818', fill_color='EB1616.3', line_width=1),
        ], 24, ),
        bottom=bar.Bar([
            widget.GroupBox(urgent_alert_method='text', **widget_defaults),
            widget.Prompt(foreground='#20C020', **widget_defaults),
            widget.Spacer(),
            # widget.Notify(**widget_defaults), # ???
            widget.Systray(**widget_defaults),
            # widget.Volume(**widget_defaults),
            widget.Clock(
                '%Y.%m.%d %H:%M:%S',
                **widget_defaults),
        ], 30, ),
    ),
]


@hook.subscribe.client_new
def dialogs(window):
    if(window.window.get_wm_type() == 'dialog'
       or window.window.get_wm_transient_for()
       or not window.window.get_wm_class()
       or 'gmrun' in window.window.get_wm_class()
       or 'emulator64-arm' in window.window.get_wm_class()):
        window.floating = True


def main(qtile):

    dynamic_groups = {
        'io': {'exclusive': False, 'layout': 'pidgin'},
        'gimp': {'exclusive': False, 'layout': 'gimp'},
        'www': {'exclusive': False, 'layout': 'tile'},
        'eclipse': {'exclusive': False, 'layout': 'tile'},
    }

    global static_groups
    for group in static_groups:
        dynamic_groups[group] = {'persist': True}

    apps = [
        {'match': Match(wm_class=['Pidgin'], role=['Buddy List']), 'group': 'io'},
        {'match': Match(wm_class=['google-chrome', 'Google-chrome']), 'group': 'www'},
        {'match': Match(wm_class=['eclipse', 'Eclipse']), 'group': 'eclipse'},
        {'match': Match(wm_class=['gimp', 'Gimp']), 'group': 'gimp'},
        {'match': Match(wm_class=['Titanium Studio']), 'group': 'eclipse'},
    ]

    DGroups(qtile, dynamic_groups, apps, simple_key_binder('mod3'))

    lazy.spawn('feh --bg-scale ~/sajat/bg.jpg')
