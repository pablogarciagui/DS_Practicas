import 'elementoEmpresa.dart';

class Empleado extends ElementoEmpresa {
  String nombre = '';
  String dni = '';
  String cargo = '';
  String tipoContrato = '';

  Empleado(nombre, String dni, String cargo, String tipoContrato)
  {
    this.nombre = nombre;
    this.dni = dni;
    this.cargo = cargo;
    this.tipoContrato = tipoContrato;
  }

  @override
  String mostrarJerarquia(){
    String string="Empleado:\n";
    string += "\tNombre: "+ this.nombre+" \n";
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

  @override
  void addElementoEmpresa(ElementoEmpresa elemento)
  {

  }

  @override
  void removeElementoEmpresa(ElementoEmpresa elemento)
  {

  }

  @override
  bool? esSuPadre(ElementoEmpresa departamento)
  {

  }

  @override
  void cambiarSuperior(ElementoEmpresa nuevoSuperior)
  {

  }

  @override
  ElementoEmpresa getElementoEmpresa(int index)
  {
    return this;
  }

  @override
  String toString(){
    String s = this.nombre;
    return s;
  }

}