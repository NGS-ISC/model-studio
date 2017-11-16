using Gtk;
using GLib;
using Icc.Gui;

// https://aztlan.fciencias.unam.mx/~canek/building-vala-applications/

namespace ModelStudio {
	[GtkTemplate (ui = "/org/gtk/model-studio/ui/application_window.glade")]
	public class ApplicationWindow: Gtk.ApplicationWindow {
		[GtkChild]
		public Gtk.Box main_box;

		public ApplicationWindow(Gtk.Application application) {
			GLib.Object(application: application);
		}

		// public void on_application_acquire_widgets(Gtk.Builder builder) {
		// 	stdout.printf("Acquiring widgets.\n");
		// 	main_box=builder.get_object ("main_box") as Gtk.Box;
		// 	add(main_box);
		// }

	}

	public class Application : Gtk.Application {
		ApplicationWindow application_window;

		protected new void on_startup () {
			stdout.puts("Startup of ModelStudio\n");
			application_window = new ApplicationWindow(this);
			add_window(application_window);
			// this.acquire_widgets.connect(application_window.on_application_acquire_widgets);

			// try {
			// 	load_ui_from_file("../ui/application_window.glade");
			// } catch (GLib.Error e) {
			// 	stderr.puts("Cannot load user interface components.\n");
			// 	init_failure();
			// }
		}

		// construct {
		// 	this.startup.connect(on_startup);
		// }

	}

	public static int main (string[] args) {
		var app = new Application();
		return app.run(args);
	}
}
