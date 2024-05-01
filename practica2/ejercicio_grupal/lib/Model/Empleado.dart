import 'ElementoEmpresa.dart';

class Empleado extends ElementoEmpresa {
  String nombre = '';
  String dni = '';
  String cargo = '';
  String tipoContrato = '';
  ElementoEmpresa? DepSuperior;

  Empleado.vacio();

  Empleado(nombre, String dni, String cargo, String tipoContrato,
      ElementoEmpresa? superior) {
    this.nombre = nombre;
    this.dni = dni;
    this.cargo = cargo;
    this.tipoContrato = tipoContrato;
    if (superior != null) {
      DepSuperior = superior;
      DepSuperior?.addElementoEmpresa(this);
    }
  }

  @override
  String mostrarJerarquia() {
    String string = "Empleado:\n";
    string += "\tNombre: " + this.nombre + " \n";
    string += "\tDNI: " + this.dni + " \n";
    string += "\tCargo: " + this.cargo + " \n";
    string += "\tContrato actual: " + this.tipoContrato + " \n";
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
  void addElementoEmpresa(ElementoEmpresa elemento) {
    throw UnimplementedError();
  }

  @override
  void removeElementoEmpresa(ElementoEmpresa? elemento) {
    throw UnimplementedError();
  }

  @override
  bool? esSuPadre(ElementoEmpresa departamento) {
    throw UnimplementedError();
  }

  @override
  void cambiarSuperior(ElementoEmpresa? nuevoSuperior) {
    this.DepSuperior = nuevoSuperior;
  }

  @override
  ElementoEmpresa getElementoEmpresa(int index) {
    return this;
  }

  @override
  String toString() {
    String s = this.nombre;
    return s;
  }

  ElementoEmpresa? getElemento(ElementoEmpresa elemento) {
    return null;
  }

  String getDni(){
    return dni;
  }
  String getTipoContrato(){
    return tipoContrato;
  }
  String getCargo(){
    return cargo;
  }
  @override
  ElementoEmpresa? getSuperior(){
    return DepSuperior;
  }
  @override
  List<ElementoEmpresa> getElementos() { throw UnimplementedError();}

  @override
  void delete() {
    DepSuperior = null;
  }
}
