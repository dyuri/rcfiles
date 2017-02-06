from libqtile.widget import base
from libqtile import bar
import subprocess

__all__ = [
    'Launcher',
]


class Launcher(base._TextBox):
    ''' Widget to start an application '''
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [
        ("font", "Arial", "Text font"),
        ("fontsize", None, "Font pixel size. Calculated if None."),
        ("fontshadow", None,
            "font shadow color, default is None(no shadow)"),
        ("padding", 3, "Padding left and right. Calculated if None."),
        ("background", None, "Background colour."),
        ("foreground", "#ffffff", "Foreground colour."),
        ("label", None, "Label."),
    ]

    def __init__(self, command, text='', **config):

        if text is '':
            text = command[:1].upper()

        base._TextBox.__init__(self, text, width=bar.CALCULATED, **config)
        self.command = command

    def button_press(self, x, y, button):
        if button == 1 and self.command:
            subprocess.Popen(self.command.split(), shell=True)

    def update(self):
        self.bar.draw()
        return True
