from typing import List  # noqa: F401
import os
import subprocess
from libqtile import hook, window
from libqtile import qtile
from libqtile import bar, layout, widget
import libqtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.layout import columns, ratiotile
from libqtile.layout.floating import Floating
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()
browser = "brave"
dmenu = "dmenu_run -fn 'Inconsolata 9' -h 30 -i -p run:"



keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "m", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    
    #Toggle between floating and tiled
    Key([mod], "s", lazy.window.toggle_floating()),

    #Toggle fullscreen mode
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    Key([mod], "Tab", lazy.screen.toggle_group()),

    Key([mod, "shift"], "e", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "w", lazy.shutdown(), desc="Shutdown Qtile"),


    #Volume Keys
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute")),
    
    #Brightness Control
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 1920+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 1920-")),

    #Launch Applications
    Key([mod], "t", lazy.spawn(browser), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn(dmenu), desc="Launch dmenu"),
    Key([mod], "p", lazy.spawn(terminal +" -e zsh -i -c ranger"), desc="Launch dmenu"),

    #Application 'scroll'
    Key([mod], "o", lazy.screen.next_group()),
    Key([mod], "i", lazy.screen.prev_group())
]

group_names = [("一", {'layout': 'columns'}),
               ("二", {'layout': 'columns'}),
               ("三", {'layout': 'columns'}),
               ("四", {'layout': 'columns'}),
               ("五", {'layout': 'columns'}),
               ("六", {'layout': 'columns'}),
               ("七", {'layout': 'columns'})]


groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group


layouts = [
    layout.Columns(
        border_focus_stack='#A9A9A9',
        border_focus='#A9A9A9',
        border_width = 0,
        margin = 15
        ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='BitstreamVeraSansMonoNerd Font Bold',
    border_width=0,
    fontsize=15,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=10),
                widget.CurrentLayout(),
                widget.TextBox(text="|"),
                widget.GroupBox(
                    username="ahaduk",
                    highlight_method="line",
                    disable_drag=True,
                    ),
                widget.WindowName(
                    max_chars=20),
                widget.Systray(),
                libqtile.widget.Mpris2(
                scroll_wait_intervals = 999999,
                    display_metadata = ['xesam:title', 'xesam: artist'],
                    objname = 'org.mpris.MediaPlayer2.spotify',
                    stop_pause_text = None,
                    scroll_chars=100,
                    fmt = '{}',
                    ),
                widget.Spacer(),
                libqtile.widget.OpenWeather(
                    cityid = "5104836",
                    metric = False,
                    fmt = "{}",
                    format = "☀ {main_temp} ℉"
                        ),
                widget.Backlight(
                    backlight_name="intel_backlight",
                    fmt = "  {}"
                    ),
                widget.Spacer(length=10),
                widget.Volume(
                    fmt=" {}"
                    ),
                widget.Spacer(length=10),
                widget.TextBox(text='',
                   fontsize=16,
                   foreground='#d8dee9'),
                widget.Battery(foreground='#d8dee9',
                   low_foreground='e39400',
                   charge_char = '',
                   format='{percent:2.0%}',
                   low_percentage=.2,
                   ),
                widget.Clock(format='%a %I:%M %p'),
                widget.QuickExit(
                    countdown_format='{}',
                    default_text='',
                    #font = 'Font Awesome 5 Free'
                ),
                widget.Spacer(
                    length=7
                    )
            ],
            30,
            background="#222222"
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False #cursor follows focus
floating_layout = layout.Floating(
        border_width=0,
        float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])



auto_minimize = False
auto_fullscreen = True
focus_on_window_activation = "smart"


# Fixes some java app errors.
wmname = "LG3D"

#Autostart
@hook.subscribe.startup_once
def autostart():
    start = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([start])
