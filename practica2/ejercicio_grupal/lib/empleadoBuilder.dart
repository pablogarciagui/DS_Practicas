import 'package:ejercicio_grupal/elementoEmpresa.dart';

import 'empleado.dart';
import 'elementoEmpresa.dart';

abstract class EmpleadoBuilder {
    late Empleado empleado;

    EmpleadoBuilder(ElementoEmpresa? DepSuperior)
    {
        empleado = new Empleado("","","","", DepSuperior);
    }

    EmpleadoBuilder build(String nombre, String dni, String cargo, ElementoEmpresa? DepSuperior);

    Empleado getEmpleado(){
        return empleado;
    }

}

class EmpleadoMedioTiempoBuilder extends EmpleadoBuilder{

    EmpleadoMedioTiempoBuilder(ElementoEmpresa? DepSuperior) : super(DepSuperior){
    }
    @override
     EmpleadoBuilder build(String nombre, String dni, String cargo,ElementoEmpresa? DepSuperior) {
        empleado.setNombre(nombre);
        empleado.setDni(dni);
        empleado.setCargo(cargo);
        empleado.setTipoContrato("Medio Tiempo");
        if (DepSuperior != null) {
          empleado.DepSuperior = DepSuperior;
          empleado.DepSuperior?.addElementoEmpresa(empleado);
        }
        return this;
    }

}

class EmpleadoTiempoCompletoBuilder extends EmpleadoBuilder{

    EmpleadoTiempoCompletoBuilder(ElementoEmpresa? DepSuperior) : super(DepSuperior){
    }
    @override

    EmpleadoBuilder build(String nombre, String dni, String cargo, ElementoEmpresa? DepSuperior) {
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
