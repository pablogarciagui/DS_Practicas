import 'package:ejercicio_grupal/Model/EmpleadoMedioTiempoBuilder.dart';
import 'package:ejercicio_grupal/Model/EmpleadoTiempoCompletoBuilder.dart';
import 'package:ejercicio_grupal/Model/TipoBuilder.dart';

import 'EmpleadoBuilder.dart';
import 'ElementoEmpresa.dart';
import 'Empleado.dart';
import 'Departamento.dart';

class Director {
  late EmpleadoBuilder builder;
  late List<ElementoEmpresa> empresa;
  ElementoEmpresa? seleccionado;

  Director(EmpleadoBuilder builder) {
    this.builder = builder;
    empresa = <ElementoEmpresa>[];
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
      if (seleccionado == null) {
        if (elemento.getSuperior() != null) {
          elemento.getSuperior()?.removeElementoEmpresa(elemento);
          elemento.cambiarSuperior(null);
        }
        empresa.add(elemento);
      } else if (seleccionado is Departamento) {
        // addElementoEmpresa del departamento ya se encarga de cambiarle el superior a él si hiciera falta
        seleccionado?.addElementoEmpresa(elemento);
      }
    }
  }

  Empleado addEmpleado(
      String nombre, String dni, String cargo, ElementoEmpresa? superior) {
    Empleado e = Empleado.vacio();
    if (nombre.trim().isNotEmpty &&
        dni.trim().isNotEmpty &&
        cargo.trim().isNotEmpty) {
      builder.build(nombre, dni, cargo, superior);
      if (seleccionado == null) {
        e = builder.getEmpleado();
        empresa.add(e);
      }
    }
    return e;
  }

  Departamento? addDepartamento(String nombre, ElementoEmpresa? superior) {
    Departamento dep;
    if (nombre.trim().isNotEmpty) {
      if (seleccionado == null) {
        dep = Departamento(nombre, null);
        this.addElementoEmpresa(dep);
        return dep;
      } else {
        dep = Departamento(nombre, superior);
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

  ElementoEmpresa getElementoSeleccionado() {
    return seleccionado!;
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

  // AL CREAR UN DEPARTAMENTO O EMPLEADO, SELE DEBE AÑADIR TAMBIÉN EL ID DE SU SUPERIOR. NO BASTA CON ASIGNARLE EL OBJETO

  // EJECUTAR CADA VEZ QUE SE METAN DATOS DESDE JSON //
  void asignarSuperiores(){
    // recorrer recursivamente la estructura comprobando si hay elementos scados de json sin superior
    // Añade:
    // - objeto DepSuperior
    // - id del objeto Dep Superior
  }

  void asignarHijos(){
    // recorrer recursivamente la estructura comprobando si hay elementos sacados de json sin hijos
    // almacena en un multimap id_superior: hijo, hijo...
    // al encontrar un elemento cuyo id está en el multimap y que tendría que tener hijos pero no los tiene, empieza a añadir los ElementosEmpresa con id asignado a este elemento
  }
  /////////////////////////////////////////////////////
}
