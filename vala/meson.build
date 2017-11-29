project('model_studio', 'c', 'vala')

api = get_option('api')

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

lib_src = files(['model_studio.vala']) + [gen_resources]


ms_library = library('model-studio-' + api,
           lib_src,
           dependencies: [glib, gobject, gtk],
           # link_with: gflow,
           # include_directories: gflow_inc,
           vala_gir: 'ModelStudio-' + api + '.gir',
           vala_args: vala_args,
           install: false
)


ms_typelib = custom_target('model-studio-typelib',
              command: [g_ir_compiler, '--output', '@OUTPUT@', meson.current_build_dir() + '/ModelStudio-' + api + '.gir',
                       # '--shared-library', get_option('prefix') + '/' + get_option('libdir') + '/libmodelstudio-'+ api +'.so'
                       '--shared-library', 'libmodelstudio-'+ api +'.so'
                       ],
              output: 'ModelStudio-' + api + '.typelib',
              depends: ms_library,
              install: false,
              install_dir: get_option('libdir') + '/girepository-1.0')


test_src = files(['model_studio-test.vala'])

executable('model-studio', test_src,
dependencies: [glib, gobject, gtk],
depends: ms_typelib,
link_with: ms_library,
)
