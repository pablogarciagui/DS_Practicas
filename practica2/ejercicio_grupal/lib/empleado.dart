import 'elementoEmpresa.dart';

class Empleado extends ElementoEmpresa {
  String nombre = '';
  String dni = '';
  String cargo = '';
  String tipoContrato = '';

  Empleado(String nombre, String dni, String cargo, String tipoContrato) : super('')
  {
    this.nombre = nombre;
    this.dni = dni;
    this.cargo = cargo;
    this.tipoContrato = tipoContrato;
  }

  String toString(){
    String string="";
    string += "Nombre: "+ this.nombre+" \n";
    string += "\tDNI: "+ this.dni+" \n";
    string += "\tCargo: "+ this.cargo+" \n";
    string += "\tContrato actual: "+ this.tipoContrato+" \n";
    return string;
  }

  void setNombre(String nombre) {
    this.nombre = nombre;
  }

  void setDni(String dni) {
    this.dni = dni;
  }

  void setCargo(String cargo) {
    this.cargo = cargo;
  }

  void setTipoContrato(String tipoContrato) {
    this.tipoContrato = tipoContrato;
  }

  // Si vemos que no hace falta esto se quita
  void addEmpleado(Empleado empleado){
    System.out.println("Un empleado no puede contener elementos jerarquicos");
  }

  void addDepartamento(Departamento departamento){
    System.out.println("Un empleado no puede contener elementos jerarquicos");
  }

  void removeEmpleado(String dni){
    System.out.println("Un empleado no puede contener elementos jerarquicos");
  }
  
  void removeDepartamento(String nombre){
    System.out.println("Un empleado no puede contener elementos jerarquicos");
  }
}