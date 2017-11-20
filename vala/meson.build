project('model_studio', 'c', 'vala')

api = '0.1'

pkgconfig = import('pkgconfig')
glib = dependency('glib-2.0')
gtk = dependency('gtk+-3.0')
gobject = dependency('gobject-2.0')

g_ir_compiler = find_program('g-ir-compiler')
glib_CR = find_program('glib-compile-resources')

grcdir = meson.current_source_dir()
gres = meson.current_source_dir()+'/'+'model_studio.gresource.xml'
vala_args = ['--gresources='+gres, '--gresourcesdir='+grcdir]
#resources_file = meson.current_build_dir()+'/'+'resources.c'
resources_file = 'resources.c'

gen_resources = custom_target('gen-resources',
              input: [gres],
              output: [resources_file],
              command: [glib_CR, '@INPUT@',
                       '--target', '@OUTPUT@',
                       '--sourcedir='+meson.current_source_dir(),
                       '--generate-source'
              ]
)

executable('model-studio', ['model_studio.vala', gen_resources],
dependencies: [glib, gobject, gtk],
vala_args: vala_args
)
