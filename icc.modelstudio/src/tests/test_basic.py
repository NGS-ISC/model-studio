from nose.plugins.skip import SkipTest
from nose.tools import assert_raises, nottest
import os

typelib = '/home/eugeneai/development/codes/ngs/model-studio/vala/builddir'

os.environ['GI_TYPELIB_PATH'] = typelib

#@SkipTest


class TestBasic:

    def setUp(self):
        pass

    def test_something(self):
        assert 1 + 1 == 2

    def test_gobject(self):
        import gi
        gi.require_version('Gtk', '3.0')
        gi.require_version('GFlow', '0.2')
        gi.require_version('GtkFlow', '0.2')
        gi.require_version('ModelStudio', '0.1')
        from gi.repository import GLib
        from gi.repository import Gtk
        from gi.repository import GFlow
        from gi.repository import GtkFlow
        from gi.repository import ModelStudio

    def tearDown(self):
        pass
