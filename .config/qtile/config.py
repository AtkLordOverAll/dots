import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "st"

keys = [
    # Manipulating windows
    # Move windows up or down in current stack
    Key([mod], "Down", lazy.layout.shuffle_down(),
        desc = "Move window down in current stack"),
    Key([mod], "Up", lazy.layout.shuffle_up(),
        desc = "Move window up in current stack"),
    # Change size of main window
    Key([mod], "Right", lazy.layout.cmd_grow_main(),
        desc = "Increase the size of the master window"),
    Key([mod], "Left", lazy.layout.cmd_shrink_main(),
        desc = "Decrease the size of the master window"),
    # Swap windows
    Key([mod, "shift"], "Left", lazy.layout.cmd_swap_left(),
        desc = "Swap focoussed window left"),
    Key([mod, "shift"], "Right", lazy.layout.cmd_swap_right(),
        desc = "Swap focussed window right"),
    
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc = "Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc = "Kill focused window"),
    
    # Lock, restart, close Qtile
    Key([mod], "l", lazy.spawn("i3lock -ec 555558 --nofork"), desc = "Lock screen"),
    Key([mod, "shift"], "r", lazy.restart(), desc = "Restart qtile"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc = "Shutdown qtile"),
    
    # Programs
    # Launcher
    Key([mod], "d", lazy.spawn("rofi_launcher"),
        desc = "Open rofi launcher"),
    Key([mod, "shift"], "d", lazy.spawn("USE_SUDO=true rofi_launcher"),
        desc = "Open rofi launcher (run as root)"),
    # Terminal
    Key([mod], "Return", lazy.spawn(terminal), desc = "Launch terminal"),
    # Screenshots & snips
    Key([], "Print", lazy.spawn("maim | xclip -selection clipboard -t image/png"),
        desc = "Take a screenshot"),
    Key(["shift"], "Print", lazy.spawn("maim --select | xclip -selection clipboard -t image/png"),
        desc = "Take a snip"),
    Key(["control"], "Print", lazy.spawn("maim --window=$(xdotool getactivewindow) | xclip -selection clipboard -t image/png"),
        desc = "Take a screenshot of the active window"),
    # xprop
    Key([mod], "x", lazy.spawn("xprop"), desc = "Launch xprop"),
]

# Pretentious twat group names
groups = [Group(str(i)) for i in [
    "I",
    "II",
    "III",
    "IV",
    "V",
    "VI",
    "VII",
    "VIII",
    "IX",
]]

for i, g in enumerate(groups, 1):
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], str(i), lazy.group[g.name].toscreen(),
            desc = f"Switch to group {g.name}"),
        
        # mod1 + shift + letter of group = move focused window to group (switching disabled)
        Key([mod, "shift"], str(i), lazy.window.togroup(g.name, switch_group = False),
            desc = f"Switch to & move focused window to group {g.name}"),
    ])
    
layout_theme = {
    "border_width": 2,
    "margin": 6,
    "border_focus:": "#dfdfdf",
    "border_normal": "#555555",
    "single_border_width": 0,
    "single_margin": 0,
}

layouts = [
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    layout.MonadTall(
        ratio=0.55,
        **layout_theme,
    ),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font = 'Google Sans',
    fontsize = 16,
    padding = 3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom = bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors = {
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform = lambda name: name.upper(),
                ),
                widget.TextBox("default config", name = "default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground = "#d75f5f"),
                widget.Systray(),
                widget.Clock(format = '%Y-%m-%d %a %I:%M %p'),
                widget.QuickExit(),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules = [
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'pinentry-gtk-2'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "never"

wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.expanduser("~/.local/scripts/autostart")])
