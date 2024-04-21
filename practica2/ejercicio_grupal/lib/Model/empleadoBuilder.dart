import 'package:ejercicio_grupal/Model/elementoEmpresa.dart';

import 'empleado.dart';
import 'elementoEmpresa.dart';

abstract class EmpleadoBuilder {
    late Empleado empleado;

    EmpleadoBuilder(ElementoEmpresa? DepSuperior)
    {
        empleado = new Empleado.vacio();
    }

    EmpleadoBuilder build(String nombre, String dni, String cargo, ElementoEmpresa? DepSuperior);

    Empleado getEmpleado(){
        return Empleado(empleado.toString(), empleado.getDni(), empleado.getCargo(), empleado.getTipoContrato(), empleado.getSuperior());
    }

}

