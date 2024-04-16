import 'elementoEmpresa.dart';
import 'empleado.dart';

class Departamento extends ElementoEmpresa{

  Departamento(String nombre, ElementoEmpresa superior)
      : super(nombre) {
    empleados = <Empleado>[];
    subDepartamentos = <ElementoEmpresa>[];
    DepSuperior = superior;
    DepSuperior.addDepartamento(this);
  }

  @override
  void addEmpleado(Empleado empleado) {

    bool existe = false;

    for (int i = 0; i < empleados.length && !existe; i++) {
      if (empleados[i].dni == empleado.dni) {
        existe = true;
      }
    }

    if (existe) {
      print(empleado.nombre + " already belongs to department " + this.nombre);
    } else {
      empleados.add(empleado);
      print(empleado.nombre + " was added to department " + this.nombre);
    }
   }

  @override
  bool esSuPadre(ElementoEmpresa departamento){
    if (this.DepSuperior == null) {
      return false;
    } else if (departamento == this.DepSuperior) {
      return true;
    } else {
      return this.DepSuperior.esSuPadre(departamento);
    }

  }

  @override
  void addDepartamento(ElementoEmpresa departamento) {
    // El departamento que entra no tiene superior y no es el propio departamento y el que entra no es nulo
    if (departamento.DepSuperior == null && departamento != this && departamento != null) {
      // Ni yo, ni mis superiores tienen el departamento como superior
      if ( !this.esSuPadre(departamento)) {
        bool nombre_repetido = false;

        for (int i = 0; i < subDepartamentos.length && !nombre_repetido; i++) {
          if (subDepartamentos[i].nombre == departamento.nombre) {
            nombre_repetido = true;
          }
        }

        if (nombre_repetido) {
          print(departamento.nombre + " is already a subdepartment in " + this.nombre);
        } else {
          departamento.DepSuperior = this;
          subDepartamentos.add(departamento);
          print(departamento.nombre + " was added as a subdepartment of " + this.nombre);
        }
      }
    }
  }

  @override
  void cambiarSuperior(ElementoEmpresa nuevoSuperior){
    this.DepSuperior = nuevoSuperior;
  }

  @override
  void removeEmpleado(String dni) {
    if (dni != null) {
      bool existe = false;
      int id = 0;
      for (int i = 0; i < empleados.length && !existe; i++) {
        if (empleados[i].dni == dni) {
          existe = true;
          id = i;
        }
      }

      if (existe) {
        empleados.removeAt(id);
        print("Empleado with DNI: " + dni + " was removed from department " + this.nombre);
      } else {
        print("Empleado with DNI: " + dni + " does not exist in " + this.nombre);
      }
    }
  };

  @override
  void removeDepartamento(String nombre) {
    if (nombre != null) {
      bool existe = false;
      int id = 0;
      for (int i = 0; i < subDepartamentos.length && !existe; i++) {
        if (subDepartamentos[i].nombre == nombre) {
          existe = true;
          id = i;
        }
      }
      if (existe) {
        subDepartamentos.removeAt(id);
        print("Subdepartamento with name: " + nombre + " was removed from " + this.nombre);
      } else {
        print("Subdepartamento with name: " + nombre + " does not exist in " + this.nombre);
      }
    }
  }

  @override
  String toString() {
    String string = this.nombre + "\n";
    string += "Lista de empleados directos del departamento "+this.nombre+":\n";
    for (int i = 0; i < empleados.length; i++) {
      string += i + ".\t" + empleados[i].toString();
    }
    string += "Lista de subdepartamentos:\n";
    for (int i = 0; i < subDepartamentos.length; i++) {
      string +="SubDep:"+ 1 + "\t" + subDepartamentos[i].toString();
    }
    return string;
  }
}