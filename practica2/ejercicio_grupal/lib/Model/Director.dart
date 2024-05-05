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
    if(elemento.toString().trim().isNotEmpty){
      if (elemento is Empleado) {
        if(elemento.getDni().trim().isNotEmpty
            && elemento.getTipoContrato().trim().isNotEmpty
            && elemento.getCargo().trim().isNotEmpty){
          elemento_aceptable = true;
        }
      } else {
        elemento_aceptable = true;
      }
    }

    if(elemento_aceptable){
      if(seleccionado == null){
        if(elemento.getSuperior() != null){
          elemento.getSuperior()?.removeElementoEmpresa(elemento);
          elemento.cambiarSuperior(null);
        }
        empresa.add(elemento);
      } else if (seleccionado is Departamento){
        // addElementoEmpresa del departamento ya se encarga de cambiarle el superior a él si hiciera falta
        seleccionado?.addElementoEmpresa(elemento);
      }
    }
  }

  void addEmpleado(
      String nombre, String dni, String cargo, ElementoEmpresa? superior) {
    if (nombre.trim().isNotEmpty && dni.trim().isNotEmpty && cargo.trim().isNotEmpty) {
      builder.build(nombre, dni, cargo, superior);
      if (seleccionado == null) {
        empresa.add(builder.getEmpleado());
      }
    }
  }

  void addDepartamento(String nombre, ElementoEmpresa? superior) {
    if (nombre.trim().isNotEmpty) {
      if (seleccionado == null) {
        empresa.add(Departamento(nombre, null));
      } else {
        Departamento(nombre, superior);
      }
    }
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
}
