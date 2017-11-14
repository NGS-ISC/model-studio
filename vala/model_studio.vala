using Gtk;
using GLib;
using Icc.Gui;

namespace ModelStudio {

	public class Application : Icc.Gui.Application {
		public Application() {
			base(
				null, // "model-studio.icc",
				0,
				"../ui/application_window.glade"
				);
			this.startup.connect(on_startup);
		}

		// public override signal void acquire_widgets (Application app, Gtk.Builder builder) {
		// 	base(app, builder);
		// 	stdout.printf("OK\n");
		// }

		protected void on_startup () {
			stdout.puts("Startup of ModelStudio\n");
		}
	}

	public static int main (string[] args) {
		var app = new Application();
		return app.run(args);
	}
}
