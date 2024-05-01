import 'ElementoEmpresa.dart';

class Departamento extends ElementoEmpresa {
  String nombre = '';
  late List<ElementoEmpresa> elementos;
  ElementoEmpresa? DepSuperior;

  Departamento(String nombre, ElementoEmpresa? superior) {
    this.nombre = nombre;
    elementos = <ElementoEmpresa>[];

    if (superior != null) {
      DepSuperior = superior;
      DepSuperior?.addElementoEmpresa(this);
    }
  }

  @override
  void addElementoEmpresa(ElementoEmpresa elemento) {
    // TODO: implement addElementoEmpresa
    ElementoEmpresa? sup = elemento.getSuperior();
    if(sup!=null){   //Pertenece a otro departamento, hay que eliminarlo
      sup.getElementos().remove(elemento);
    }
    elementos.add(elemento);
    elemento.cambiarSuperior(this);

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
    this.DepSuperior = nuevoSuperior;
  }

  @override
  void removeElementoEmpresa(ElementoEmpresa? elemento) {
    elementos.remove(elemento);
    elemento?.delete();
  }

  @override
  ElementoEmpresa getElementoEmpresa(int index) {
    return elementos[index];
  }

  @override
  String mostrarJerarquia() {
    String string = "Departamento: " + this.nombre + "\n";
    for (int i = 0; i < elementos.length; i++) {
      string += "\t" + elementos[i].toString();
    }
    return string;
  }

  @override
  List<ElementoEmpresa> getElementos() {
    return elementos;
  }

  @override
  String toString() {
    String s = this.nombre;
    return s;
  }

  @override
  ElementoEmpresa? getElemento(ElementoEmpresa elemento) {
    for (int i = 0; i < elementos.length; i++) {
      if (elementos[i] == elemento) return elemento.getElementoEmpresa(i);
    }
    return null;
  }

  @override
  ElementoEmpresa? getSuperior(){
    return DepSuperior;
  }

  @override
  void delete(){
    for(int i = 0; i< elementos.length; i++){
      elementos[i].delete();
    }
    DepSuperior = null;
    elementos.clear();
  }
}
