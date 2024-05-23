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
        if (elemento.getDni()!.trim().isNotEmpty &&
            elemento.getTipoContrato()!.trim().isNotEmpty &&
            elemento.getCargo()!.trim().isNotEmpty) {
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
      String nombre, String dni, String cargo, ElementoEmpresa? superior,String usuario) {
    Empleado e = Empleado.vacio();
    if (nombre.trim().isNotEmpty &&
        dni.trim().isNotEmpty &&
        cargo.trim().isNotEmpty) {
      builder.build(nombre, dni, cargo, superior,usuario);
      if (seleccionado == null) {
        e = builder.getEmpleado();
        empresa.add(e);
      }
    }
    return e;
  }

  Departamento? addDepartamento(String nombre, ElementoEmpresa? superior, String usuario) {
    Departamento dep;
    if (nombre.trim().isNotEmpty) {
      if (seleccionado == null) {
        dep = Departamento.parametros(nombre, null, usuario, -1); // añadido lo de usuario y el id del superior. -1 se usa como NULL
        //dep = Departamento();
        this.addElementoEmpresa(dep);
        return dep;
      } else {
        if(superior != null && superior is Departamento){
          dep = Departamento.parametros(nombre, superior, usuario, superior.dep_superior); // añadido lo de usuario y el id del superior
        }
        else{
          dep = Departamento.parametros(nombre, superior, usuario, null); // añadido lo de usuario y el id del superior
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

  // Sanear JSON de entrada

  Departamento? getDepartamento(int? id){
    Departamento? departamento;

    for(var elemento in empresa){
      if(elemento is Departamento && elemento.id == id){
        departamento = elemento;
      }
    }

    return departamento;
  }

  List<ElementoEmpresa>? getHijos(int? id){
    List<ElementoEmpresa>? hijos;

    for(var elemento in empresa){
      if(elemento is Empleado && elemento.dep_superior == id){
        if(hijos == null){
          hijos = [elemento];
        }
        else{
          hijos.add(elemento);
        }
      }
      else if(elemento is Departamento && elemento.dep_superior == id){
        if(hijos == null){
          hijos = [elemento];
        }
        else{
          hijos.add(elemento);
        }
      }
    }

    return hijos;
  }
  
  // Ejecutar cada vez que se importa un JSON
  void asignarElementosSuperiores(){
    for (var elemento in empresa){
      if(elemento is Empleado && elemento.DepSuperior == null){
        elemento.DepSuperior = getDepartamento(elemento.dep_superior);
      }
      else if(elemento is Departamento && elemento.DepSuperior == null){
        elemento.DepSuperior = getDepartamento(elemento.dep_superior);

        if(elemento.elementos == null){
          elemento.elementos = getHijos(elemento.id);
        }
      }
    }
  }
}
