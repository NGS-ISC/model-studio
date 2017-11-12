# Example package with a console entry point
from __future__ import print_function


def main(*args, **kwargs):
    from isu.gui.gtk import main
    main(*args, **kwargs)
