import 'package:ejercicio_grupal/Model/EmpleadoBuilder.dart';
import 'package:flutter/material.dart';
import 'Model/Director.dart';
import 'Model/ElementoEmpresa.dart';

void main() {
  //print("hola");
  /*
  Sum misuma1 = new Sum(5, 10);
  Sum misuma2 = new Sum(2, 7);

  //print(misuma1.resultado());

  List<Sum> sumassss = [misuma1, misuma2];
  for(int i=0; i<sumassss.length; i++){
    print(sumassss[i].resultado());
  }
  */


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Gestión',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sistema de Gestión'),
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
  int num_empleados = 0;
  int num_departamentos = 0;
  TextEditingController nombre_dep = new TextEditingController();
  TextEditingController dni = new TextEditingController();
  TextEditingController cargo = new TextEditingController();
  TextEditingController tipo_contrato = new TextEditingController();

  void addEmpleado(){
    // añadir a "base de datos"
    // añadir a lista visual

    setState(() {
      num_empleados++;
    });
  }

  void addDepartamento(){
    // añadir a "base de datos"
    // añadir a lista visual

    setState(() {
      num_departamentos++;
    });
  }

  @override
  void dispose() {
    nombre_dep.dispose();
    dni.dispose();
    cargo.dispose();
    tipo_contrato.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$num_departamentos',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'Departamentos:',
            ),
            TextField(
              controller: nombre_dep,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
            ElevatedButton(
              onPressed: addDepartamento,
              child: const Text('Añadir'),
            ),
            Text(
              '$num_empleados',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'Empleados:',
            ),
            TextField(
              controller: dni,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'DNI',
              ),
            ),
            TextField(
              controller: cargo,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cargo',
              ),
            ),
            TextField(
              controller: tipo_contrato,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tipo de contrato',
              ),
            ),
            ElevatedButton(
              onPressed: addEmpleado,
              child: const Text('Añadir'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEmpleado,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


void _addDepartment(ElementoEmpresa? DepSuperior) {
  Director director = new Director(new EmpleadoMedioTiempoBuilder());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String name = '';
      return AlertDialog(
        title: Text('Add Department'),
        content: TextFormField(
          decoration: InputDecoration(hintText: 'Department name'),
          onChanged: (value) {
            name = value;
          },
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                director.addDepartamento(name, DepSuperior);
              });
            },
          ),
        ],
      );
    },
  );
}

void _addEmployee(ElementoEmpresa? DepSuperior) {
  late Director director;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String name = '';
      String dni = '';
      String position = '';
      String contractType = '';
      return AlertDialog(
        title: Text('Add Employee'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Employee name'),
              onChanged: (value) {
                name = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'DNI'),
              onChanged: (value) {
                dni = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Position'),
              onChanged: (value) {
                position = value;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(hintText: 'Contract type'),
              value: contractType,
              onChanged: (value) {
                setState(() {
                  contractType = value!;
                });
              },
              items: ['Full-time', 'Part-time']
                  .map((contractType) => DropdownMenuItem(
                value: contractType,
                child: Text(contractType),
              ))
                  .toList(),
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.of(context).pop();
              if(contractType == 'Full-time')
                director = new Director(new EmpleadoTiempoCompletoBuilder(DepSuperior));
              else
                director = new Director(new EmpleadoMedioTiempoBuilder(DepSuperior));
              setState(() {
                director.addEmpleado(name, dni, position, DepSuperior);
              });
            },
          ),
        ],
      );
    },
  );
}

