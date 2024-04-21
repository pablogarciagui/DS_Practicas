import 'empleado.dart';

abstract class ElementoEmpresa {

  void addElementoEmpresa(ElementoEmpresa elemento);

  void removeElementoEmpresa(ElementoEmpresa? elemento);

  bool? esSuPadre(ElementoEmpresa departamento);

  void cambiarSuperior(ElementoEmpresa? nuevoSuperior);

  ElementoEmpresa getElementoEmpresa(int index);

  ElementoEmpresa? getElemento(ElementoEmpresa elemento);

  String mostrarJerarquia();

  String toString();

  ElementoEmpresa? getSuperior();

  List<ElementoEmpresa> getElementos();

  void delete();
}