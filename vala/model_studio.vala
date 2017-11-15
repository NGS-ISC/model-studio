using Gtk;
using GLib;
using Icc.Gui;

// https://aztlan.fciencias.unam.mx/~canek/building-vala-applications/

namespace ModelStudio {
	public class ApplicationWindow: Gtk.ApplicationWindow {
		public Gtk.Box main_box {private set; get;}

		// public ApplicationWindow(Gtk.Application app) {
		// 	base(app);
		// }

		public void on_application_acquire_widgets(Gtk.Builder builder) {
			stdout.printf("Acquiring widgets.\n");
			main_box=builder.get_object ("main_box") as Gtk.Box;
			add(main_box);
		}

	}

	public class Application : Icc.Gui.Application {

		protected new void on_startup () {
			stdout.puts("Startup of ModelStudio\n");
			application_window = new ApplicationWindow(this);
			add_window(application_window);
			this.acquire_widgets.connect(application_window.on_application_acquire_widgets);

			try {
				load_ui_from_file("../ui/application_window.glade");
			} catch (GLib.Error e) {
				stderr.puts("Cannot load user interface components.\n");
				init_failure();
			}
		}

		construct {
			this.startup.connect(on_startup);
		}

	}

	public static int main (string[] args) {
		var app = new Application();
		return app.run(args);
	}
}
