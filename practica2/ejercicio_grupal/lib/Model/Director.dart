import 'package:ejercicio_grupal/Model/EmpleadoMedioTiempoBuilder.dart';
import 'package:ejercicio_grupal/Model/EmpleadoTiempoCompletoBuilder.dart';
import 'package:ejercicio_grupal/Model/TipoBuilder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'EmpleadoBuilder.dart';
import 'ElementoEmpresa.dart';
import 'Empleado.dart';
import 'Departamento.dart';

class Director {
  late EmpleadoBuilder builder;
  late List<ElementoEmpresa> empresa;
  ElementoEmpresa? seleccionado;
  final String apiUrlEmp = "http://localhost:3000/empleado";
  final String apiUrlDep = "http://localhost:3000/departamento";

  Director(EmpleadoBuilder builder) {
    this.builder = builder;
    empresa = <ElementoEmpresa>[];
  }

  Future<void> cargarEmpresa(String usuario) async {
    empresa.clear();
    final response = await http.get(Uri.parse('$apiUrlDep?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> empresaJson = json.decode(response.body);

      empresa.addAll(
          empresaJson.map((json) => Departamento.fromJson(json)).toList());
    } else {
      throw Exception('Fallo de carga de empresa');
    }

    final response2 = await http.get(Uri.parse('$apiUrlEmp?usuario=$usuario'));
    if (response2.statusCode == 200) {
      List<dynamic> empresaJson = json.decode(response2.body);

      empresa
          .addAll(empresaJson.map((json) => Empleado.fromJson(json)).toList());
    } else {
      throw Exception('Fallo de carga de empresa');
    }
    asignarElementosSuperiores();
  }

  Future<ElementoEmpresa> agregar(ElementoEmpresa elementoEmpresa) async {
    late ElementoEmpresa elemento;
    if (elementoEmpresa is Departamento) {
      final response = await http.post(
        Uri.parse(apiUrlDep),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode((elementoEmpresa as Departamento).toJson()),
      );
      if (response.statusCode == 201) {
        elemento = Departamento.fromJson(json.decode(response.body));
        addElementoEmpresa(elemento);
      } else {
        throw Exception('Fallo añadir elementoEmpresa, Dep: ${response.body}');
      }
    } else if (elementoEmpresa is Empleado) {
      if (builder is EmpleadoTiempoCompletoBuilder) {
        elementoEmpresa.setTipoContrato("Tiempo Completo");
      } else {
        elementoEmpresa.setTipoContrato("Medio Tiempo");
      }
      final response = await http.post(
        Uri.parse(apiUrlEmp),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode((elementoEmpresa as Empleado).toJson()),
      );
      if (response.statusCode == 201) {
        elemento = Empleado.fromJson(json.decode(response.body));
        addElementoEmpresa(elemento);
      } else {
        throw Exception('Fallo añadir elementoEmpresa, Emp: ${response.body}');
      }
    }
    return elemento;
  }

  void addElementoEmpresa(ElementoEmpresa elemento) {
    bool elemento_aceptable = false;
    if (elemento.toString().trim().isNotEmpty) {
      if (elemento is Empleado) {
        if (elemento.getDni().trim().isNotEmpty &&
            elemento.getTipoContrato().trim().isNotEmpty &&
            elemento.getCargo().trim().isNotEmpty) {
          elemento_aceptable = true;
        }
      } else {
        elemento_aceptable = true;
      }
    }

    if (elemento_aceptable) {
      if(elemento is Departamento){
        elemento.elementos = <ElementoEmpresa>[];
      }
      if (seleccionado == null) {
        if (elemento.getSuperior() != null) {
          elemento.getSuperior()?.removeElementoEmpresa(elemento);
          elemento.cambiarSuperior(null);
        }
        empresa.add(elemento);
      } else{
        // addElementoEmpresa del departamento ya se encarga de cambiarle el superior a él si hiciera falta
        seleccionado?.addElementoEmpresa(elemento);
      }
    }
  }

  Empleado addEmpleado(String nombre, String dni, String cargo,
      ElementoEmpresa? superior, String usuario) {
    Empleado e = Empleado.vacio();
    if (nombre.trim().isNotEmpty &&
        dni.trim().isNotEmpty &&
        cargo.trim().isNotEmpty) {
      builder.build(nombre, dni, cargo, superior, usuario);
      if (seleccionado == null) {
        e = builder.getEmpleado();
        empresa.add(e);
      }
    }
    return e;
  }

  Departamento? addDepartamento(
      String nombre, ElementoEmpresa? superior, String usuario) {
    Departamento dep;
    if (nombre.trim().isNotEmpty) {
      if (seleccionado == null) {
        dep = Departamento.parametros(nombre, null, usuario,
            -1); // añadido lo de usuario y el id del superior. -1 se usa como NULL
        //dep = Departamento();
        this.addElementoEmpresa(dep);
        return dep;
      } else {
        if (superior != null && superior is Departamento) {
          dep = Departamento.parametros(
              nombre,
              superior,
              usuario,
              superior
                  .dep_superior); // añadido lo de usuario y el id del superior
        } else {
          dep = Departamento.parametros(nombre, superior, usuario,
              null); // añadido lo de usuario y el id del superior
        }
        //dep = Departamento();
        this.addElementoEmpresa(dep);
        return dep;
      }
    }
    return null;
  }

  void remove() {
    if (seleccionado != null) {
      if (seleccionado?.getSuperior() == null) {
        empresa.remove(seleccionado);
        seleccionado?.delete();
      } else {
        seleccionado?.getSuperior()?.removeElementoEmpresa(seleccionado);
      }
      seleccionado = null;
    }
  }

  Future<void> eliminar() async {
    if (seleccionado != null) {
      if (seleccionado is Departamento) {
        final response = await http.delete(
          Uri.parse('$apiUrlDep/${(seleccionado as Departamento).id}'),
        );
        if (response.statusCode == 200) {
          this.remove();
        } else {
          throw Exception('Fallo eliminacion departamento');
        }
      }

      if (seleccionado is Empleado) {
        final response = await http.delete(
          Uri.parse('$apiUrlEmp/${(seleccionado as Empleado).id}'),
        );
        if (response.statusCode == 200) {
          this.remove();
        } else {
          throw Exception('Fallo eliminacion empleado');
        }
      }
    }
  }

  List<ElementoEmpresa> getEmpresa() {
    return empresa;
  }

  void changeBuilder(TipoBuilder tipoBuilder) {
    ElementoEmpresa? sup = seleccionado is Departamento ? seleccionado : null;
    if (tipoBuilder == TipoBuilder.completo) {
      builder = EmpleadoTiempoCompletoBuilder(sup);
    } else {
      builder = EmpleadoMedioTiempoBuilder(sup);
    }
  }

  TipoBuilder getTipoBuilder() {
    return builder is EmpleadoTiempoCompletoBuilder
        ? TipoBuilder.completo
        : TipoBuilder.parcial;
  }

  ElementoEmpresa getElemento(int index) {
    return empresa[index];
  }

  ElementoEmpresa? getElementoSeleccionado() {
    return seleccionado;
  }

  void setElementoSeleccionado(ElementoEmpresa? e) {
    if (seleccionado == e) {
      seleccionado = null;
    } else {
      seleccionado = e;
    }
  }

  List<ElementoEmpresa>? getElementosSubdepartamento(ElementoEmpresa e) {
    if (e.getSuperior() != null) {
      return e.getElementos();
    } else {
      return null;
    }
  }

  bool puedeTenerHijos(ElementoEmpresa e) {
    if (e is Departamento) {
      return true;
    } else {
      return false;
    }
  }

  bool estaSeleccionado(ElementoEmpresa e) {
    if (e == seleccionado) {
      return true;
    } else {
      return false;
    }
  }

  // Sanear JSON de entrada

  Departamento? getDepartamento(int? id) {
    Departamento? departamento;
    bool encontrado = false;
    for (int i = 0; i < empresa.length && !encontrado; i++) {
      if (empresa[i] is Departamento && (empresa[i] as Departamento).id == id) {
        departamento = empresa[i] as Departamento;
        encontrado = true;
      }
    }

    return departamento;
  }

  List<ElementoEmpresa>? getHijos(int? id, List<ElementoEmpresa> quitar) {
    List<ElementoEmpresa> hijos = <ElementoEmpresa>[];

    for (var elemento in empresa) {
      if (elemento.get_superior() == id) {
        hijos.add(elemento);
        quitar.add(elemento);
      }
    }

    return hijos;
  }

  // Ejecutar cada vez que se importa un JSON
  void asignarElementosSuperiores() {
    List<ElementoEmpresa> quitar = <ElementoEmpresa>[];

    for (var elemento in empresa) {
      if (elemento is Empleado && elemento.DepSuperior == null) {
        elemento.DepSuperior = getDepartamento(elemento.dep_superior);
      } else if (elemento is Departamento && elemento.DepSuperior == null) {
        elemento.DepSuperior = getDepartamento(elemento.dep_superior);

        if (elemento.elementos == null) {
          elemento.elementos = getHijos(elemento.id, quitar);
          if(elemento.elementos == null){
            elemento.elementos = <ElementoEmpresa>[];
          }
        }
      }
    }
    for (var elemento in quitar) {
      empresa.remove(elemento);
    }
  }

  EmpleadoBuilder getBuilder() {
    return builder;
  }
}
