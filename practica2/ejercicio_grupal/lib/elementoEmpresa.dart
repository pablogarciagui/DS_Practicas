import 'empleado.dart';

abstract class ElementoEmpresa {
  late String nombre;
  late List<ElementoEmpresa> subDepartamentos;
  late List<Empleado> empleados;
  late ElementoEmpresa DepSuperior;

  ElementoEmpresa(String nombre) {
    this.nombre = nombre;
  }

  void addEmpleado(Empleado empleado);

  bool esSuPadre(ElementoEmpresa departamento);

  void addDepartamento(ElementoEmpresa departamento);

  void cambiarSuperior(ElementoEmpresa nuevoSuperior);

  void removeEmpleado(String dni);

  void removeDepartamento(String nombre);

  String toString();
}