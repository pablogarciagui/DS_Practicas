import 'empleado.dart';

abstract class EmpleadoBuilder {
    late Empleado empleado;

    EmpleadoBuilder()
    {
        empleado = new Empleado("","","","");
    }

    EmpleadoBuilder build(String nombre, String dni, String cargo);

    Empleado getEmpleado(){
        return empleado;
    }

}

class EmpleadoMedioTiempoBuilder extends EmpleadoBuilder{
    @override
     EmpleadoBuilder build(String nombre, String dni, String cargo) {
        empleado.setNombre(nombre);
        empleado.setDni(dni);
        empleado.setCargo(cargo);
        empleado.setTipoContrato("Medio Tiempo");
        return this;
    }

}

class EmpleadoTiempoCompletoBuilder extends EmpleadoBuilder{
    @override
    EmpleadoBuilder build(String nombre, String dni, String cargo) {
        empleado.setNombre(nombre);
        empleado.setDni(dni);
        empleado.setCargo(cargo);
        empleado.setTipoContrato("Tiempo Completo");
        return this;
    }

}
