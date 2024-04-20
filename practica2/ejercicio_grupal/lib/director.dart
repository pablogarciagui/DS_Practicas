import 'empleadoBuilder.dart';
import 'empleado.dart';
import 'elementoEmpresa.dart';
import 'Departamento.dart';

class Director {
  late EmpleadoBuilder builder;
  late ElementoEmpresa empresa;

  Director(EmpleadoBuilder builder)
  {
    this.builder = builder;
    empresa = new Departamento('Empresa', null);
  }

  void addEmpleado(String nombre, String dni, String cargo, ElementoEmpresa? superior) {
    builder.build(nombre, dni, cargo, superior);
    if(superior == null)
      empresa.addElementoEmpresa(builder.getEmpleado());
  }

  void addDepartamento(String nombre, ElementoEmpresa? superior){
    empresa.addElementoEmpresa(Departamento(nombre, superior));
  }

  void remove(ElementoEmpresa elemento){
    empresa.removeElementoEmpresa(elemento);
  }

 ElementoEmpresa getEmpresa(){
    return empresa;
  }

}