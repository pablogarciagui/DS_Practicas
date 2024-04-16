import 'elementoEmpresa.dart';
import 'empleado.dart';

class Departamento extends ElementoEmpresa{

  Departamento(super.nombre, ElementoEmpresa superior)
  {
    empleados = new List<Empleado>;
    subDepartamentos = new List<ElementoEmpresa>;
    DepSuperior = superior;
    DepSuperior.addDepartamento(this);
  }


  void addEmpleado(Empleado empleado) {
    if (empleado != null) {
      bool existe = false;

      for (int i = 0; i < empleados.size() && !existe; i++) {
        if (empleados.get(i).dni == empleado.dni) {
          existe = true;
        }
      }

      if (existe) {
        System.out.println(empleado.nombre + " ya pertenece al departamento " + this.nombre);
      } else {
        empleados.add(empleado);
        System.out.println(empleado.nombre + " fue añadido al departamento " + this.nombre);
      }
    }
  }

  @override
  bool esSuPadre(ElementoEmpresa departamento){

    if (this.DepSuperior == null) {
      // Si mi superior es nulo, el que entra no puede ser mi padre
      return false;
    }else if(departamento == this.DepSuperior){
      // Si mi superior es el que entra, el que entra es mi padre
      return true;
    }else {
      // Si tengo superior, pero no es el que entra, le pregunto a mi padre si
      // su superior es el que entra
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

        for (int i = 0; i < subDepartamentos.size() && !nombre_repetido; i++) {
          if (subDepartamentos.get(i).nombre == departamento.nombre) {
            nombre_repetido = true;
          }
        }

        if (nombre_repetido) {
          System.out.println(departamento.nombre + " ya es subdepartamento en " + this.nombre);
        } else {
          departamento.DepSuperior = this;
          this.subDepartamentos.add(departamento);
          System.out.println(departamento.nombre + " fue añadido como subdepartamento de " + this.nombre);
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
      for (int i = 0; i < empleados.size() && !existe; i++) {
        if (empleados.get(i).dni == dni) {
          existe = true;
          id = i;
        }
      }

      if (existe) {
        empleados.remove(id);
        System.out.println("Empleado con DNI: " + dni + " ha sido elimiado del departamento " + this.nombre);
      } else {
        System.out.println("Empleado con DNI: " + dni + " no existe en " + this.nombre);
      }
    }
  };

  @override
  void removeDepartamento(String nombre) {
    if (nombre != null) {
      Boolean existe = false;
      int id = 0;
      for (int i = 0; i < subDepartamentos.size() && !existe; i++) {
        if (subDepartamentos.get(i).nombre == nombre) {
          existe = true;
          id = i;
        }
      }
      if (existe) {
        subDepartamentos.remove(id);
        System.out.println("Subdepartamento con nombre: " + nombre + " ha sido elimiado del departamento " + this.nombre);
      } else {
        System.out.println("Subdepartamento con nombre: " + nombre + " no existe en " + this.nombre);
      }
    }
  }

  @override
  String toString() {
    String string = this.nombre + "\n";
    string += "Lista de empleados directos del departamento "+this.nombre+":\n";
    for (int i = 0; i < empleados.size(); i++) {
      string += i + ".\t" + empleados.get(i).toString();
    }
    string += "Lista de subdepartamentos:\n";
    for (int i = 0; i < subDepartamentos.size(); i++) {
      string +="SubDep:"+ 1 + "\t" + subDepartamentos.get(i).toString();
    }
    return string;
  }
}