using Gtk;
using GLib;
using ModelStudio;

namespace ModelStudio {
	public static int main (string[] args) {
		var app = new ModelStudio.Application();
		return app.run(args);
	}
}
