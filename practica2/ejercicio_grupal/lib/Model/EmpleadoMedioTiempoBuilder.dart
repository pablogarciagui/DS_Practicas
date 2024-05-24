import 'package:ejercicio_grupal/Model/Departamento.dart';
import 'package:ejercicio_grupal/Model/ElementoEmpresa.dart';
import 'package:ejercicio_grupal/Model/Empleado.dart';
import 'package:ejercicio_grupal/Model/EmpleadoBuilder.dart';

class EmpleadoMedioTiempoBuilder extends EmpleadoBuilder {
  EmpleadoMedioTiempoBuilder(ElementoEmpresa? DepSuperior) : super(DepSuperior);

  @override
  EmpleadoBuilder build(String nombre, String dni, String cargo,
      ElementoEmpresa? DepSuperior, String usuario) {
    empleado = Empleado.vacio();
    empleado.setNombre(nombre);
    empleado.setDni(dni);
    empleado.setCargo(cargo);
    empleado.setTipoContrato("Medio Tiempo");
    empleado.setUsuario(usuario);
    if (DepSuperior != null && DepSuperior is Departamento) {
      empleado.DepSuperior = DepSuperior;
      empleado.DepSuperior?.addElementoEmpresa(empleado);
      empleado.dep_superior = (DepSuperior as Departamento).id;
    } else {
      empleado.DepSuperior = null;
      empleado.dep_superior = null;
    }

    return this;
  }
}
