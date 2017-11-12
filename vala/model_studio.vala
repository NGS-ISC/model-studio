using Gtk;
using GLib;

namespace ModelStudio {
	public bool DEBUG = true;
	public class Application : Object {

		public Gtk.ApplicationWindow application_window;
		public Gtk.Builder ui_builder;

		protected string ui_filename;

		public Application(string filename = "") throws GLib.Error {
			this.ui_builder=new Gtk.Builder();
			application_window = null;
			if (filename == "") {
				ui_filename = null;
			} else {
				load_ui_from_file(filename);
			};
		}

		// public Application.from_file(string filename):Application() throws GLib.Error {
		// 	load_ui_from_file(filename);
		// }

		public void load_ui_from_file(string filename) throws GLib.Error {
			this.ui_filename=filename;
			this.ui_builder.add_from_file(this.ui_filename);
			acquire_application_window();
			this.acquire_widgets.connect(test);
			acquire_widgets(this, this.ui_builder);
		}

		public void test() {
			stdout.printf("OK\n");
		}

		public virtual signal void acquire_widgets (Application app, Gtk.Builder builder) {
			acquire_application_window();
		}

		private void acquire_application_window (){
			application_window = ui_builder.get_object("application_window") as Gtk.ApplicationWindow;
			application_window.destroy.connect(on_application_window_destroy);
		}

		public virtual void on_application_window_destroy() {
			if (DEBUG) {
				stdout.printf("Closing application\n");
			}
			Gtk.main_quit();
		}
	}

	public void on_acquire_widgets(Application app, Gtk.Builder builder) {
		stdout.printf("Acquire widgets: Application\n");
	}

	int test_run (string[] args) {
		Gtk.init (ref args);

		try {
			var app = new Application();
			app.acquire_widgets.connect_after(on_acquire_widgets);
			app.acquire_widgets.connect(() => stdout.printf("B11\n"));
			app.load_ui_from_file("../ui/application_window.glade");
			app.application_window.show_all();
			Gtk.main();
		} catch (GLib.Error e) {
			stderr.printf("Could not load user interface: %s\n", e.message);
			return 1;
		}
		return 0;
	}

	int main (string[] args) {
		return test_run(args);
	}
}
