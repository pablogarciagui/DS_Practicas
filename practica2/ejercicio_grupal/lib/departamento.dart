import 'elementoEmpresa.dart';
import 'empleado.dart';

class Departamento extends ElementoEmpresa{
  late String _nombre;
  late List<ElementoEmpresa> _elementos;

  Departamento(this._nombre){
    _elementos = [];
  }


  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
  }

  List<ElementoEmpresa> get elementos => _elementos;

  set elementos(List<ElementoEmpresa> value) {
    _elementos = value;
  }

  @override
  void addElementoEmpresa(ElementoEmpresa elemento) {
    // TODO: implement addElementoEmpresa
    _elementos.add(elemento);
  }

  @override
  ElementoEmpresa getElementoEmpresa(int index) {
    // TODO: implement getElementoEmpresa
    return _elementos[index];
  }

  @override
  String mostrarJerarquia([int indent = 0]) {
    // TODO: implement mostrarJerarquia
    String s = '\t' * indent + "Departamento: " + _nombre;

    for(var elemento in _elementos){
      elemento.mostrarJerarquia(indent+1);
    }
    return s;
  }

  @override
  void removeElementoEmpresa(ElementoEmpresa elemento) {
    _elementos.remove(elemento);
  }

  @override
  String getNombre(){
    return _nombre;
  }

  @override
  List<ElementoEmpresa> getElementos() {
    // TODO: implement getElementos
    return elementos;
  }


}