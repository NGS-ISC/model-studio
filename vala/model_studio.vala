using Gtk;
using GLib;
using Icc.Gui;

// https://aztlan.fciencias.unam.mx/~canek/building-vala-applications/

namespace ModelStudio {
	[GtkTemplate (ui = "/org/gtk/icc/model-studio/application_window.glade")]
	public class ApplicationWindow: Gtk.ApplicationWindow {
		[GtkChild]
		public Gtk.Box main_box;

		public ApplicationWindow(Gtk.Application application) {
			GLib.Object(application: application);
		}

		// [GtkCallback]
		// protected bool on_application_window_destroy_event() {
		// 	stderr.puts("destroy-event\n");
		// 	return true;
		// }


		[GtkCallback]
		protected void on_destroy() {
			application.quit();
		}

	}

	public class Application : Gtk.Application {
		ApplicationWindow application_window;

		construct {
			this.startup.connect(on_startup);
			this.activate.connect(on_activate);
		}

		protected void on_startup () {
			stdout.puts("Startup of ModelStudio\n");
			application_window = new ApplicationWindow(this);
			// application_window.destroy.connect(on_application_window_destroy);
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

		protected void on_activate() {
			application_window.show_all();
		}

	}

	public static int main (string[] args) {
		var app = new Application();
		return app.run(args);
	}
}
