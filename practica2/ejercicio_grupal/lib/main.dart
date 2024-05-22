import 'package:ejercicio_grupal/Model/Empleado.dart';
import 'package:ejercicio_grupal/Model/EmpleadoTiempoCompletoBuilder.dart';
import 'package:ejercicio_grupal/Model/TipoBuilder.dart';
import 'package:ejercicio_grupal/Widgets/ListaElementosWidget.dart';
import 'package:ejercicio_grupal/Model/Director.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gestión de Empresa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nombre = TextEditingController();
  TextEditingController dni = TextEditingController();
  TextEditingController cargo = TextEditingController();
  TextEditingController tipo_contrato = TextEditingController();
  TextEditingController nombre_dep = new TextEditingController();
  final Director director = Director(EmpleadoTiempoCompletoBuilder(null));

  String currentUser = "Carmen";
  List<String> users = ["Carmen", "Pablo", "Marta", "Jesús"];

  @override
  void initState() {
    super.initState();
    _cargarEmpresaInicial();
  }

  void _cargarEmpresaInicial() async {
    try {
      // await director.cargarEmpresa(currentUser);
      setState(() {});
    } catch (e) {
      print("Problemas cargando: $e");
    }
  }

  @override
  void dispose() {
    nombre.dispose();
    dni.dispose();
    cargo.dispose();
    tipo_contrato.dispose();
    nombre_dep.dispose();
    super.dispose();
  }

  callback() {
    setState(() {});
  }

  void removeElement() {
    setState(() {
      director.remove();
    });
  }

  void removeElementBD() {
    try {
      //AQUI VA EL ELIMINAR
      // await director.remove();
    } catch (e) {
      print("Error eliminando elemento: $e");
    }
    setState(() {});
  }

  void addEmpleadoBD() {
    if (nombre.text.isNotEmpty
        && dni.text.isNotEmpty
        && cargo.text.isNotEmpty) {
      try {
        // AQUI VA EL AÑADIR
        //await director.agregar(Empleado(dni: null,
            //descripcion: text, completada: false, usuario: currentUser));
        nombre.clear();
        dni.clear();
        cargo.clear();
      } catch (e) {
        print("Error añadiendo empleado: $e");
      }
      setState(() {});
    }
  }

  void addEmpleado() {
    setState(() {
      director.addEmpleado(
          nombre.text, dni.text, cargo.text, director.seleccionado);
    });
  }

  void addDepartamentoBD() {

    if (nombre_dep.text.isNotEmpty) {
      try {
        //AQUI VA EL AÑADIR
        //await director.agregar(DIRECTOR);
        nombre_dep.clear();
      } catch (e) {
        print("Error añadiendo departamento: $e");
      }
      setState(() {});
    }
  }

  void addDepartamento() {
    setState(() {
      director.addDepartamento(nombre_dep.text, director.seleccionado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title,
            style: TextStyle(
              color: Theme.of(context).canvasColor,
            )),
        actions: <Widget>[
          DropdownButton<String>(
            value: currentUser,
            icon: Icon(Icons.arrow_downward),
            onChanged: (String? newValue) {
              if (newValue != null && newValue != currentUser) {
                setState(() {
                  currentUser = newValue;
                  _cargarEmpresaInicial();
                });
              }
            },
            items: users.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.surface.withOpacity(1),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: nombre_dep,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre del Departamento',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: addDepartamento,
                      label: const Text('Depart.'),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: nombre,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre del Empleado',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        controller: dni,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'DNI',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: cargo,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cargo',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    DropdownMenu<TipoBuilder>(
                      requestFocusOnTap: true,
                      initialSelection: TipoBuilder.completo,
                      label: const Text('Tipo de Contrato'),
                      onSelected: (TipoBuilder? op) {
                        setState(() {
                          if (op != null &&
                              op is TipoBuilder &&
                              op != director.getTipoBuilder()) {
                            director.changeBuilder(op);
                          }
                        });
                      },
                      dropdownMenuEntries: TipoBuilder.values
                          .map<DropdownMenuEntry<TipoBuilder>>(
                              (TipoBuilder op) {
                        return DropdownMenuEntry<TipoBuilder>(
                          value: op,
                          label: op.label,
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: addEmpleado,
                      label: const Text("Empleado"),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: ListaElementosWidget(
            director: director,
            listElems: director.getEmpresa(),
            callback: callback,
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: removeElement,
        child: const Icon(Icons.delete_forever_outlined),
      ),
    );
  }
}
