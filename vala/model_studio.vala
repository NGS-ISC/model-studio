using Gtk;
using GLib;
using Icc.Gui;

namespace ModelStudio {

	public class Application : Icc.Gui.Application {
		public Gtk.Box main_box {private set; get;}

		public void on_acquire_widgets (Icc.Gui.Application app, Gtk.Builder builder) {
			stdout.printf("Acquiring widgets.\n");
			main_box=builder.get_object ("main_box") as Gtk.Box;
			application_window.add(main_box);
		}

		protected new void on_startup () {
			stdout.puts("Startup of ModelStudio\n");
			try {
				load_ui_from_file("../ui/application_window.glade");
			} catch (GLib.Error e) {
				stderr.puts("Cannot load user interface components.\n");
				init_failure();
			}
		}

		construct {
			this.acquire_widgets.connect(on_acquire_widgets);
			this.startup.connect(on_startup);
		}

	}

	public static int main (string[] args) {
		var app = new Application();
		return app.run(args);
	}
}
