from nose.plugins.skip import SkipTest
from nose.tools import assert_raises, nottest

#@SkipTest


class TestBasic:

    def setUp(self):
        pass

    def test_something(self):
        assert 1 + 1 == 2

    def test_gobject(self):
        import gi
        gi.require_version('Gtk', '3.0')
        from gi.repository import GLib
        from gi.repository import Gtk
        #gi.require_version('GFlow', '1.0')
        from gi.repository import GFlow
        from gi.repository import GtkFlow

    def tearDown(self):
        pass
