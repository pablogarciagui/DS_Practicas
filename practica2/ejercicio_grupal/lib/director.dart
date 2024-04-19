import 'empleadoBuilder.dart';
import 'empleado.dart';
import 'elementoEmpresa.dart';
import 'Departamento.dart';

class Director {
  late EmpleadoBuilder builder;
  late List<ElementoEmpresa> empresa;

  Director(EmpleadoBuilder builder)
  {
    this.builder = builder;
    empresa = <ElementoEmpresa> [];
  }

  void addEmpleado(String nombre, String dni, String cargo) {
    builder.build(nombre, dni, cargo);
    empresa.add(builder.getEmpleado());
  }

  void addDepartamento(String nombre, ElementoEmpresa? superior){
    empresa.add(Departamento(nombre, superior));
  }

}