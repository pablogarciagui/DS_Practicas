import 'elementoEmpresa.dart';
import 'empleado.dart';

class Departamento extends ElementoEmpresa{
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
    elementos.add(elemento);
  }


  @override
  bool? esSuPadre(ElementoEmpresa departamento){
    if (this.DepSuperior == null) {
      return false;
    } else if (departamento == this.DepSuperior) {
      return true;
    } else {
      bool? r = this.DepSuperior?.esSuPadre(departamento);
      if (r==null || r == false)
        return false;
      else
        return true;
    }

  }

  @override
  void cambiarSuperior(ElementoEmpresa nuevoSuperior){
    this.DepSuperior = nuevoSuperior;
  }

  @override
  void removeElementoEmpresa(ElementoEmpresa elemento){
    elementos.remove(elemento);
  }

  @override
  ElementoEmpresa getElementoEmpresa(int index){
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

  List<ElementoEmpresa> getElementos(){
    return elementos;
  }

  @override
  String toString(){
    String s = this.nombre;
    return s;
  }
}