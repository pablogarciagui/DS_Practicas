import 'elementoEmpresa.dart';

class Empleado extends ElementoEmpresa {
  String dni = '';
  String cargo = '';
  String tipoContrato = '';

  Empleado(String nombre, String dni, String cargo, String tipoContrato) : super('')
  {
    super.nombre = nombre;
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
    super.nombre = nombre;
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


  void addEmpleado(Empleado empleado){
    // error
  }

  void addDepartamento(ElementoEmpresa departamento){
    // error
  }

  void removeEmpleado(String dni){
    // error
  }
  
  void removeDepartamento(String nombre){
    // error
  }
}