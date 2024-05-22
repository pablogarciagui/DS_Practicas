import 'ElementoEmpresa.dart';

class Departamento extends ElementoEmpresa {
  String? nombre;
  late List<ElementoEmpresa>? elementos;
  ElementoEmpresa? DepSuperior;
  // Añadidos para poder operar con la base de datos
  int? id;
  String? usuario;
  int? dep_superior;

  /*
  Departamento(String nombre, ElementoEmpresa? superior) {
    this.nombre = nombre;
    elementos = <ElementoEmpresa>[];

    if (superior != null) {
      DepSuperior = superior;
      DepSuperior?.addElementoEmpresa(this);
    }
  }*/

  Departamento({this.nombre, this.elementos, this.DepSuperior, this.id, this.usuario, this.dep_superior});

  @override
  void addElementoEmpresa(ElementoEmpresa elemento) {
    ElementoEmpresa? sup = elemento.getSuperior();
    if(sup!=null){   //Pertenece a otro departamento, hay que eliminarlo
      sup.getElementos().remove(elemento);
    }
    elemento.cambiarSuperior(this);
    elementos!.add(elemento);
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
    return elementos!;
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
}
