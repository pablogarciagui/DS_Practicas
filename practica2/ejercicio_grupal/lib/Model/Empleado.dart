import 'package:ejercicio_grupal/Model/Departamento.dart';

import 'ElementoEmpresa.dart';

class Empleado extends ElementoEmpresa {
  String? nombre;
  String? dni;
  String? cargo;
  String? tipoContrato;
  ElementoEmpresa? DepSuperior;
  int? id;

  // Para conexion con base de datos
  int? dep_superior;
  String? usuario;

  Empleado.vacio();

  Empleado.parametros(String nombre, String dni, String cargo, String tipoContrato, ElementoEmpresa? superior, String usuario) {
    this.nombre = nombre;
    this.dni = dni;
    this.cargo = cargo;
    this.tipoContrato = tipoContrato;
    this.usuario = usuario;
    if (superior != null) {
      DepSuperior = superior;
      DepSuperior?.addElementoEmpresa(this);
      dep_superior = (superior as Departamento ).id;
    }else{
      dep_superior = null;
      DepSuperior = null;
    }
  }

  Empleado({this.nombre, this.dni, this.cargo, this.tipoContrato, this.DepSuperior, this.dep_superior, this.usuario, this.id});

  @override
  String mostrarJerarquia() {
    String string = "Empleado:\n";
    string += "\tNombre: " + this.nombre! + " \n";
    string += "\tDNI: " + this.dni! + " \n";
    string += "\tCargo: " + this.cargo! + " \n";
    string += "\tContrato actual: " + this.tipoContrato! + " \n";
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

  void setUsuario(String us) {
    this.usuario = us;
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
    String s = this.nombre ?? "";
    return s;
  }

  ElementoEmpresa? getElemento(ElementoEmpresa elemento) {
    return null;
  }

  String getDni(){
    return dni ?? "";
  }
  String getTipoContrato(){
    return tipoContrato ?? "";
  }
  String getCargo(){
    return cargo ?? "";
  }

  String getUsuario(){
    return usuario ?? "";
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

  factory Empleado.fromJson(Map<String, dynamic> json) {
    return Empleado(
      nombre: json['nombre'] as String?,
      dni: json['dni'] as String?,
      cargo: json['cargo'] as String?,
      tipoContrato: json['contrato'] as String?,
      DepSuperior: null,
      dep_superior: json['dep_superior'] as int?,
      usuario: json['usuario'] as String?,
      id: json['id'] as int?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id':id,
      'dni':dni,
      'nombre': nombre,
      'cargo': cargo,
      'contrato': tipoContrato,
      'dep_superior': this.dep_superior,
      'usuario': usuario
    };
  }

  @override
  int? get_superior() {
    // TODO: implement get_superior
    return dep_superior;
  }
}
