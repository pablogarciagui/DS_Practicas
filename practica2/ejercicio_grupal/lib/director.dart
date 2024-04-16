import 'empleadoBuilder.dart';
import 'empleado.dart';

class Director {
  late EmpleadoBuilder builder;

  Director(EmpleadoBuilder builder)
  {
    this.builder = builder;
  }

  Empleado buildEmpleado(String nombre, String DNI, String cargo) {
    this.builder.build(nombre, DNI, cargo);
    return this.builder.getEmpleado();
  }

}