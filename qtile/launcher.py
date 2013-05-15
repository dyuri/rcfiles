from libqtile.widget import base
from libqtile import manager, bar
import subprocess

__all__ = [
    'Launcher',
]


class Launcher(base._TextBox):
    ''' Widget to start an application '''
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

    def __init__(self, command, **config):
        base._TextBox.__init__(self, '0', width=bar.CALCULATED, **config)
        self.command = command

    def _configure(self, qtile, bar):
        base._TextBox._configure(self, qtile, bar)

    def button_press(self, x, y, button):
        if button == 1 and self.command:
            subprocess.Popen(self.command.split(), shell=True)

    def update(self):
        return True

    def draw(self):
        if self.label:
            self.text = self.label
        elif self.command:
            self.text = self.command[:1].upper()

        base._TextBox.draw(self)
