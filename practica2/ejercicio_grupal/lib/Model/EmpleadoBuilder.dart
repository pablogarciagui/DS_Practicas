import 'package:ejercicio_grupal/Model/ElementoEmpresa.dart';
import 'Empleado.dart';

abstract class EmpleadoBuilder {
    late Empleado empleado;

    EmpleadoBuilder(ElementoEmpresa? DepSuperior)
    {
        empleado = Empleado.vacio();
    }

    EmpleadoBuilder build(String nombre, String dni, String cargo, ElementoEmpresa? DepSuperior, String usuario);

    Empleado getEmpleado(){
        return Empleado.parametros(empleado.toString(), empleado.getDni(), empleado.getCargo(), empleado.getTipoContrato(), empleado.getSuperior(), empleado.getUsuario());
    }

}

