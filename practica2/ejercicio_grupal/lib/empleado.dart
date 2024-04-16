import 'elementoEmpresa.dart';

class Empleado extends ElementoEmpresa {
  String dni = '';
  String cargo = '';
  String tipoContrato = '';

  Empleado(super.nombre, String dni, String cargo, String tipoContrato)
  {
    this.dni = dni;
    this.cargo = cargo;
    this.tipoContrato = tipoContrato;
  }

  @override
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

  @override
  void addEmpleado(Empleado empleado)
  {

  }
  @override
  bool esSuPadre(ElementoEmpresa departamento)
  {
    return false;
  }
  @override
  void addDepartamento(ElementoEmpresa departamento)
  {

  }
  @override
  void cambiarSuperior(ElementoEmpresa nuevoSuperior)
  {

  }
  @override
  void removeEmpleado(String dni)
  {

  }
  @override
  void removeDepartamento(String nombre)
  {

  }
}