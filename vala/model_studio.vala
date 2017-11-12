using Gtk;
using GLib;
using Icc.Gui;

namespace ModelStudio {

	public class Application : Icc.Gui.Application {
		public Application() {
			this.acquire_widgets.connect(test);
			Object(
				application_id:"model-studio.icc",
				flags: 0,
				filename:"../ui/application_window.glade"
				);
		}

		public void test() {
			stdout.printf("OK\n");
		}

	}

	int test_run (string[] args) {
		var app = new Application();
		return app.run(args);
	}

	int main (string[] args) {
		return test_run(args);
	}
}
