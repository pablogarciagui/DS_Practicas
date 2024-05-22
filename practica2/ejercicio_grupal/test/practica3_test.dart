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
      employee = Empleado('John Doe', '12345678A', 'Software Engineer',
          'Tiempo Completo', null);
      department1 = Departamento('Department 1', null);
      department2 = Departamento('Department 2', null);
    });

    test('Añadir empleado a empleado', () async {
      expect(() async => director.addEmpleado('Jane Doe', '98765432B',
          'Software Engineer', employee),
          throwsUnimplementedError);
    });

    test('Añadir Departamento a Departamento', () async {
      Departamento? childDepartment = director.addDepartamento('Child Department', department1);

      expect(department1.getElementos(), contains(childDepartment));
      expect(childDepartment?.getSuperior(), equals(department1));
    });

    test('Añadir Departamento perteneciente a un Departamento a otro', () async {
      late Departamento? childDepartment;
      childDepartment = director.addDepartamento('Child Department', department1);
      childDepartment = director.addDepartamento('Child Department', department2);

      expect(department1.getElementos(), isNot(contains(childDepartment)));
      expect(department2.getElementos(), contains(childDepartment));
      expect(childDepartment?.getSuperior(), equals(department2));
    });
    test('Añadir Empleado perteneciente a un Departamento a otro', () async {
      late Empleado subEmployee;
      subEmployee = director.addEmpleado('Jane Doe', '98765432B',
          'Software Engineer', department1);
      subEmployee = director.addEmpleado('Jane Doe', '98765432B',
          'Software Engineer', department2);

      expect(department1.getElementos(), isNot(contains(employee)));
      expect(department2.getElementos(), contains(employee));
      expect(employee.getSuperior(), equals(department2));
    });

    test('Añadir Departamento a Empleado', () async {
      expect(() async => employee.addElementoEmpresa(department1),
          throwsUnimplementedError);
    });

    test('Añadir Empleado a Departamento', () async {
      department1.addElementoEmpresa(employee);

      expect(department1.getElementos(), contains(employee));
      expect(employee.getSuperior(), equals(department1));
    });

    test('Añadir Departamento a sí mismo', () async {
      expect(() async => department1.addElementoEmpresa(department1),
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

    setUp(() {
      director = Director(EmpleadoTiempoCompletoBuilder(null));
      departmentoA = Departamento('A', null);
      departmentoB = Departamento('B', null);
      empleado1 =
          Empleado('1', '111111111L', 'Empleado', 'Tiempo Completo', null);
      empleado2 =
          Empleado('2', '999999999P', 'Empleado', 'Tiempo Completo', null);
      empleado3 =
          Empleado('3', '000000000A', 'Empleado', 'Tiempo Completo', null);

      director.addElementoEmpresa(departmentoA);
      director.addElementoEmpresa(empleado3);

      director.setElementoSeleccionado(departmentoA);
      director.addElementoEmpresa(departmentoB);
      director.addElementoEmpresa(empleado1);

      director.setElementoSeleccionado(departmentoB);
      director.addElementoEmpresa(empleado2);
      director.setElementoSeleccionado(null);
      /*
      Estructura de la empresa
        A
        -> B
        -> -> 2
        -> 1
        3
       */
    });

    test('Añadir empleado o departamento con datos parciales', () async {
      Departamento departmentIncompleto = Departamento('', null);
      Empleado empleadoIncompleto =
          Empleado('', '', '', 'Tiempo Completo', null);
      director.addElementoEmpresa(departmentIncompleto);
      director.addElementoEmpresa(empleadoIncompleto);
      expect(director.getEmpresa(), isNot(contains(departmentIncompleto)));
      expect(director.getEmpresa(), isNot(contains(empleadoIncompleto)));

      int n_elementos = director.getEmpresa().length;
      director.addEmpleado("", "", "", null);
      director.addDepartamento("", null);
      expect(director.getEmpresa().length, n_elementos);
    });

    test('Añadir empleado fuera de departamento', () async {
      Empleado empleadoAux =
          Empleado('Aux', '000000000A', 'Posicion', 'Tiempo Completo', null);
      director.addElementoEmpresa(empleadoAux);
      expect(director.getEmpresa(), contains(empleadoAux));

      director.addEmpleado('Aux', '000000000A', 'Posicion', null);
      expect(director.getEmpresa().last.toString(), 'Aux');
    });

    test('Eliminar elemento', () async {
      director.setElementoSeleccionado(empleado1);
      director.remove();
      expect(director.getEmpresa(), isNot(contains(empleado1)));

      director.setElementoSeleccionado(departmentoA);
      director.remove();
      expect(director.getEmpresa(), isNot(contains(departmentoA)));
    });

    test('Eliminar bloque completo', () async {
      director.setElementoSeleccionado(departmentoA);
      director.remove();

      expect(director.getEmpresa(), isNot(contains(departmentoA)));
    });

    test('Eliminar con nada seleccionado', () async {
      int n_elementos = director.getEmpresa().length;
      director.setElementoSeleccionado(null);

      expect(director.getEmpresa().length, n_elementos);
      expect(director.getEmpresa(), contains(empleado3));
      expect(director.getEmpresa(), contains(departmentoA));
      expect(departmentoA.getElementos(), contains(departmentoB));
      expect(departmentoA.getElementos(), contains(empleado1));
      expect(departmentoB.getElementos(), contains(empleado2));
    });

    test('Eliminar bloque elimina bien lo de dentro', () async {
      director.setElementoSeleccionado(departmentoA);
      director.remove();

      expect(director.getEmpresa(), isNot(contains(departmentoA)));
      expect(departmentoA.getElementos().length, 0);
      expect(departmentoB.getElementos().length, 0);
      expect(empleado1.getSuperior(), null);
      expect(empleado2.getSuperior(), null);
    });
  });
}
