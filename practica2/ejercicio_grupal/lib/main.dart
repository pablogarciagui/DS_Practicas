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

  @override
  void initState() {
    super.initState();
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

  void addEmpleado() {
    setState(() {
      director.addEmpleado(
          nombre.text, dni.text, cargo.text, director.seleccionado);
    });
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
