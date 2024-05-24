
import 'package:ejercicio_grupal/Model/Director.dart';
import 'package:ejercicio_grupal/Model/EmpleadoBuilder.dart';
import 'package:ejercicio_grupal/Model/EmpleadoTiempoCompletoBuilder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio_grupal/Model/Empleado.dart';
import 'package:ejercicio_grupal/Model/Departamento.dart';
import 'dart:async';

void main() {
  group('Test Práctica 3', () {
    late Director director;
    late EmpleadoBuilder builder;
    late Empleado employee;
    late Empleado subEmployee;
    late Departamento department1;
    late Departamento department2;

    setUp(() {
      builder = EmpleadoTiempoCompletoBuilder(null);
      director = Director(builder);
      employee = Empleado.parametros('John Doe', '12345678A', 'Software Engineer',
          'Tiempo Completo', null, "");
      subEmployee = Empleado.parametros('Jane Doe', '98765432B',
          'Software Engineer','Tiempo Completo', null,"");
      department1 = Departamento.parametros('Department 1', null, "",1);
      department2 = Departamento.parametros('Department 2', null, "",2);
    });

    test('Añadir empleado a empleado', () async {
      director.seleccionado = employee;
      expect(() async => await director.agregar(subEmployee),
          throwsUnimplementedError);
    });

    test('Añadir Departamento a Departamento', () async {
      director.seleccionado = department1;
      Departamento department  = await director.agregar(department2) as Departamento;

      expect(department1.getElementoEmpresa(0).getId(), equals(department.getId()));
      expect(department.getSuperior(), equals(department1));
    });

    test('Añadir Departamento perteneciente a un Departamento a otro', () async {
      late Departamento childDepartment = Departamento.parametros('Child Department', department1,"",3);
      director.seleccionado = department1;
      Departamento departamento = await director.agregar(childDepartment) as Departamento;
      director.seleccionado = department2;
      departamento = await director.agregar(childDepartment) as Departamento;

      expect(department1.getElementos(), isNot(contains(departamento)));
      expect(department2.getElementos(), contains(departamento));
      expect(departamento.getSuperior(), equals(departamento));
    });
    test('Añadir Empleado perteneciente a un Departamento a otro', () async {
      director.seleccionado = department1;
      await director.agregar(employee);
      director.seleccionado = department2;
      await director.agregar(employee);

      expect(department1.getElementos(), isNot(contains(employee)));
      expect(department2.getElementos(), contains(employee));
      expect(employee.getSuperior(), equals(department2));
    });

    test('Añadir Departamento a Empleado', () async {
      director.seleccionado = employee;
      expect(() async => await director.agregar(department1),
          throwsUnimplementedError);
    });

    test('Añadir Empleado a Departamento', () async {
      director.seleccionado = department1;
      await director.agregar(employee);
      expect(department1.getElementos(), contains(employee));
      expect(employee.getSuperior(), equals(department1));
    });

    test('Añadir Departamento a sí mismo', () async {
      director.seleccionado = department1;
      expect(() async => await director.agregar(department1),
          throwsUnimplementedError);
    });
  });

  group('Tests Práctica 3, segundo grupo', () {
    late Director director;
    late Departamento departmentoA;
    late Departamento departmentoB;
    late Empleado empleado1;
    late Empleado empleado2;
    late Empleado empleado3;

    setUp(() async{
      director = Director(EmpleadoTiempoCompletoBuilder(null));
      departmentoA = Departamento.parametros('A', null,"usuario",1);
      departmentoB = Departamento.parametros('B', null,"usuario",2);
      empleado1 =
          Empleado.parametros('1', '111111111L', 'Empleado', 'Tiempo Completo', null,"usuario");
      empleado2 =
          Empleado.parametros('2', '999999999P', 'Empleado', 'Tiempo Completo', null,"usuario");
      empleado3 =
          Empleado.parametros('3', '000000000A', 'Empleado', 'Tiempo Completo', null,"usuario");

      await director.agregar(departmentoA);
      await director.agregar(empleado3);

      director.setElementoSeleccionado(departmentoA);
      await director.agregar(departmentoB);
      await director.agregar(empleado1);

      director.setElementoSeleccionado(departmentoB);
      await director.agregar(empleado2);
      // await director.agregar(null);
      /*
      Estructura de la empresa
        A
        -> B
        -> -> 2
        -> 1
        3
       */
    });

    // ESTE TEST NO ESTA CAMBIADO
    test('Añadir empleado o departamento con datos parciales', () async {
      Departamento? departmentIncompleto = director.addDepartamento('', null,"");
      Empleado empleadoIncompleto = director.addEmpleado('', '', '', null,"");

      expect(director.getEmpresa(), isNot(contains(departmentIncompleto)));
      expect(director.getEmpresa(), isNot(contains(empleadoIncompleto)));

      int n_elementos = director.getEmpresa().length;
      director.addEmpleado("", "", "", null,"");
      director.addDepartamento("", null,"");
      expect(director.getEmpresa().length, n_elementos);
    });

    test('Añadir empleado fuera de departamento', () async {
      Empleado empleadoAux = Empleado.parametros('Aux', '000000000A', 'Posicion', "Tiempo Completo", null,"usuario");
      await director.agregar(empleadoAux);
      expect(director.getEmpresa(), contains(empleadoAux));
      expect(director.getEmpresa().last.toString(), 'Aux');
    });

    test('Eliminar elemento', () async {
      director.setElementoSeleccionado(empleado1);
      await director.eliminar();
      expect(director.getEmpresa(), isNot(contains(empleado1)));

      director.setElementoSeleccionado(departmentoA);
      await director.eliminar();
      expect(director.getEmpresa(), isNot(contains(departmentoA)));
    });

    test('Eliminar bloque completo', () async {
      director.setElementoSeleccionado(departmentoA);
      await director.eliminar();

      expect(director.getEmpresa(), isNot(contains(departmentoA)));
    });

    test('Eliminar con nada seleccionado', () async {
      int n_elementos = director.getEmpresa().length;
      director.setElementoSeleccionado(null);
      await director.eliminar();

      expect(director.getEmpresa().length, n_elementos);
      expect(director.getEmpresa(), contains(empleado3));
      expect(director.getEmpresa(), contains(departmentoA));
      expect(departmentoA.getElementos(), contains(departmentoB));
      expect(departmentoA.getElementos(), contains(empleado1));
      expect(departmentoB.getElementos(), contains(empleado2));
    });

    test('Eliminar bloque elimina bien lo de dentro', () async {
      director.setElementoSeleccionado(departmentoA);
      await director.eliminar();

      expect(director.getEmpresa(), isNot(contains(departmentoA)));
      expect(departmentoA.getElementos().length, 0);
      expect(departmentoB.getElementos().length, 0);
      expect(empleado1.getSuperior(), null);
      expect(empleado2.getSuperior(), null);
    });
  });
}
