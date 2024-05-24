import 'package:ejercicio_grupal/Model/Empleado.dart';

import 'ElementoEmpresa.dart';

class Departamento extends ElementoEmpresa {
  String? nombre;
  late List<ElementoEmpresa>? elementos;
  ElementoEmpresa? DepSuperior;
  // Añadidos para poder operar con la base de datos
  int? id;
  String? usuario;
  int? dep_superior;

  Departamento.parametros(String nombre, ElementoEmpresa? superior, String usuario, int? idSuperior) {
    this.nombre = nombre;
    elementos = <ElementoEmpresa>[];
    this.usuario = usuario;

    if (superior != null && superior is Departamento) {
      DepSuperior = superior;
      this.dep_superior = superior.id;
      DepSuperior?.addElementoEmpresa(this);
    }
  }

  Departamento({this.nombre, this.elementos, this.DepSuperior, this.id, this.usuario, this.dep_superior}){
  }

  @override
  void addElementoEmpresa(ElementoEmpresa elemento) {
    ElementoEmpresa? sup = elemento.getSuperior();

    if(sup!=null){   //Pertenece a otro departamento, hay que eliminarlo
      sup.removeElementoEmpresa(elemento);
    }
    if(elemento.getId()!=this.id){
      elemento.cambiarSuperior(this);
      elementos?.add(elemento);
    }
  }

  @override
  bool? esSuPadre(ElementoEmpresa departamento) {
    if (this.DepSuperior == null) {
      return false;
    } else if (departamento == this.DepSuperior) {
      return true;
    } else {
      bool? r = this.DepSuperior?.esSuPadre(departamento);
      if (r == null || r == false)
        return false;
      else
        return true;
    }
  }

  @override
  void cambiarSuperior(ElementoEmpresa? nuevoSuperior) {
    if(nuevoSuperior == this){
      throw UnimplementedError();
    }
    else{
      this.DepSuperior = nuevoSuperior;
    }
  }

  @override
  void removeElementoEmpresa(ElementoEmpresa? elemento) {
    elementos!.remove(elemento);
    elemento?.delete();
  }

  @override
  ElementoEmpresa getElementoEmpresa(int index) {
    return elementos![index];
  }

  @override
  String mostrarJerarquia() {
    String string = "Departamento: " + this.nombre! + "\n";
    for (int i = 0; i < elementos!.length; i++) {
      string += "\t" + elementos![i].toString();
    }
    return string;
  }

  @override
  List<ElementoEmpresa> getElementos() {
    return elementos ?? [];
  }

  @override
  String toString() {
    String s = this.nombre!;
    return s;
  }

  @override
  ElementoEmpresa? getElemento(ElementoEmpresa elemento) {
    for (int i = 0; i < elementos!.length; i++) {
      if (elementos![i] == elemento) return elemento.getElementoEmpresa(i);
    }
    return null;
  }

  @override
  ElementoEmpresa? getSuperior(){
    return DepSuperior;
  }

  @override
  void delete(){
    for(int i = 0; i< elementos!.length; i++){
      elementos![i].delete();
    }
    DepSuperior = null;
    elementos!.clear();
  }

  Departamento getPadreDesdeDirector(){
    Departamento padre = this;



    return padre;
  }

  factory Departamento.fromJson(Map<String, dynamic> json) {
    return Departamento(
      id: json['id'] as int?,
      nombre: json['nombre'] as String?,
      DepSuperior: null,
      usuario: json['usuario'] as String?,
      dep_superior: json['dep_superior'] as int?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'dep_superior': dep_superior,
      'nombre': nombre,
      'usuario': usuario
    };
  }

  @override
  int? get_superior() {
    // TODO: implement get_superior
    return dep_superior;
  }

  @override
  int? getId() {
    return id;
  }
}
