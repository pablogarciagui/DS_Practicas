import 'package:ejercicio_grupal/Model/elementoEmpresa.dart';
import 'package:ejercicio_grupal/Model/empleado.dart';
import 'package:ejercicio_grupal/Model/empleadoBuilder.dart';

class EmpleadoTiempoCompletoBuilder extends EmpleadoBuilder{

  EmpleadoTiempoCompletoBuilder(ElementoEmpresa? DepSuperior) : super(DepSuperior){
  }
  @override

  EmpleadoBuilder build(String nombre, String dni, String cargo, ElementoEmpresa? DepSuperior) {
    empleado = Empleado.vacio();
    empleado.setNombre(nombre);
    empleado.setDni(dni);
    empleado.setCargo(cargo);
    empleado.setTipoContrato("Tiempo Completo");
    if (DepSuperior != null) {
      empleado.DepSuperior = DepSuperior;
      empleado.DepSuperior?.addElementoEmpresa(empleado);
    }
    return this;
  }

}