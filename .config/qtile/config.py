import os
import subprocess

from libqtile.config import Key, Screen, Group, Drag, Click, Match, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, widget

import user

try:
    from typing import List  # noqa: F401
except ImportError:
    pass

mod = 'mod4'
alt = 'mod1'
terminal = 'termite'
browser = 'firefox'

keys = [
    # Switch between windows in current stack pane
    Key([mod], 'k', lazy.layout.down()),
    Key([mod], 'j', lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, 'control'], 'k', lazy.layout.shuffle_down()),
    Key([mod, 'control'], 'j', lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], 'space', lazy.next_layout()),
    Key([alt], 'Tab', lazy.function(user.PrevFocus())),
    Key([mod], 'q', lazy.window.kill()),
    Key([mod, 'control'], 'f', lazy.window.toggle_floating()),
    Key([mod], 'f', lazy.window.toggle_fullscreen()),

    # Rofi keys
    Key([mod], 'd', lazy.spawn('rofi -show window')),
    Key([mod], 's',
        lazy.spawn(
            '''bash -c 'termite --class "fzf-menu" -e ~/.local/bin/songChooser' '''
        )),
    Key([mod], 'g', lazy.spawn('rofi -show run')),
    Key([mod], 'r',
        lazy.spawn('rofi -modi combi -show combi -combi-modi drun,run')),

    # Launchers
    Key([mod], 'Return', lazy.spawn(terminal)),
    Key([mod], 'KP_Enter', lazy.spawn(terminal)),
    Key([mod], 'w', lazy.spawn(browser)),
    Key([], 'XF86Calculator',
        lazy.spawn('''bash -c 'termite --class "fzf-menu" -e calc' ''')),

    # Management
    Key([mod, 'control'], 's', lazy.spawn('susp')),
    Key([mod, 'control'], 'r', lazy.restart()),
    Key([mod, 'control'], 'l', lazy.spawn('locker')),
    Key([mod, 'control'], 'q', lazy.shutdown()),

    # Misc
    Key([], 'Print',
        lazy.spawn('scrot -e \'mkdir -p ~/screenshots; mv $f ~/screenshots/\'')
        ),

    # Key([mod, 'shift'], 'space', lazy.next_()),
    # Toggle between different layouts as defined below

    # Swap panes of split stack
    # Key([mod, 'shift'], 'space', lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key([mod, 'shift'], 'Return', lazy.layout.toggle_split()),
]

groups = [Group('1', matches=[Match(wm_class=['Firefox', 'Chromium'])])
          ] + [Group(i) for i in '23456']

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, 'shift'], i.name, lazy.window.togroup(i.name)),
    ])

groups += [
    ScratchPad("scratchpad", [
        DropDown(
            "zeal",
            "zeal",
            x=0,
            y=0,
            width=1.0,
            height=1.0,
            on_focus_lost_hide=True)
    ]),
]

keys.extend([
    # toggle visibiliy of above defined DropDown named "term"
    Key([mod, 'control'], 'z',
        lazy.group['scratchpad'].dropdown_toggle('zeal')),
])

layouts = [
    layout.Max(),
    layout.MonadTall(),
    # layout.Stack(num_stacks=2)
]

widget_defaults = dict(
    font='Ubuntu-C',
    fontsize=13,
    padding=4,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.TaskList(),
                widget.Prompt(),
                # widget.Sep(),
                # widget.Sep(),
                widget.Systray(),
                widget.Mpd(
                    fmt_stopped='',
                    fmt_playing='⏯ %a / %t',
                    foreground_progress='00ff00'),
                widget.TextBox(text='🔊', padding=0),
                widget.Volume(),
                widget.TextBox(text=' ', padding=4),
                widget.TextBox(text='↓', padding=0),
                widget.GenPollText(
                    func=user.allDistractingTime, update_interval=300),
                widget.TextBox(text='📈', padding=0),
                widget.GenPollText(
                    func=user.productivityPulse, update_interval=300),
                widget.GenPollText(func=user.inbox, update_interval=300),
                widget.GenPollText(
                    func=user.pacmanUpdates, update_interval=60),
                # widget.Sep(),
                # widget.Sep(),
                # widget.Notify(),
                # widget.Pomodoro(),
                # widget.Sep(),
                # widget.Battery(),
                # widget.Sep(),
                # widget.Net(),
                # widget.Sep(),
                # widget.CPUGraph(),
                # widget.Memory(),
                # widget.Image(
                #     filename='~/config/awesome/themes/multicolor/icons/mem.png'),
                widget.GenPollText(func=user.usedMem, update_interval=5),
                # widget.Sep(),
                widget.Clock(format='%a, %d'),
                widget.GenPollText(func=user.fuzClock),
                # widget.TextBox('default config', name='default'),
            ],
            24,
        ), ),
]

# Drag floating layouts.
mouse = [
    Drag([mod],
         'Button1',
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod],
         'Button3',
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {
        'wmclass': 'confirm'
    },
    {
        'wmclass': 'dialog'
    },
    {
        'wmclass': 'download'
    },
    {
        'wmclass': 'error'
    },
    {
        'wmclass': 'file_progress'
    },
    {
        'wmclass': 'notification'
    },
    {
        'wmclass': 'splash'
    },
    {
        'wmclass': 'toolbar'
    },
    {
        'wmclass': 'confirmreset'
    },  # gitk
    {
        'wmclass': 'makebranch'
    },  # gitk
    {
        'wmclass': 'maketag'
    },  # gitk
    {
        'wname': 'branchdialog'
    },  # gitk
    {
        'wname': 'pinentry'
    },  # GPG key password entry
    {
        'wmclass': 'ssh-askpass'
    },  # ssh-askpass
    {
        'wmclass': 'fzf-menu'
    },  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = 'smart'

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = 'LG3D'
