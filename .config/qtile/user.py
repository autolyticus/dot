#! /usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sh
import subprocess
from shlex import split
from io import StringIO

from libqtile import hook

def getOutput(command):
    print(f'Running command {command}')
    out = subprocess.check_output(command, shell=True)
    return out.decode().strip()


def fuzClock():
    return getOutput('fuzClock')

def usedMem():
    return getOutput(''' free -h | awk '/Mem/{print $3}' ''')

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# thanks to rogerduran for the implementation of my idea (borrowed
# from stumpwm)
class PrevFocus(object):
    """Store last focus per group and go back when called"""

    def __init__(self):
        self.groups_focus = {}
        hook.subscribe.client_focus(self.on_focus)

    def on_focus(self, window):
        group = window.group
        # only store focus if the group is set
        if not group:
            return
        group_focus = self.groups_focus.setdefault(group.name, {
            "current": None, "prev": None
        })
        # don't change prev if the current focus is the same as before
        if group_focus["current"] == window:
            return
        group_focus["prev"] = group_focus["current"]
        group_focus["current"] = window

    def __call__(self, qtile):
        group = qtile.currentGroup
        group_focus = self.groups_focus.get(group.name, {"prev": None})
        prev = group_focus["prev"]
        if prev and group.name == prev.group.name:
            group.focus(prev, False)
