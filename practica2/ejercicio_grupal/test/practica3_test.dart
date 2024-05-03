
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio_grupal/main.dart';
import 'package:ejercicio_grupal/Model/Empleado.dart';
import 'package:ejercicio_grupal/Model/Departamento.dart';

void main(){

  group('Test Práctica 3', (){

    late Empleado employee;
    late Empleado subEmployee;
    late Departamento department1;
    late Departamento department2;

    setUp(() {
      employee = Empleado('John Doe', '12345678A', 'Software Engineer', 'Tiempo Completo', null);
      subEmployee = Empleado('Jane Doe', '98765432B', 'Software Engineer', 'Tiempo Completo', null);
      department1 = Departamento('Department 1', null);
      department2 = Departamento('Department 2', null);
    });

    test('Añadir empleado a empleado', (){
      expect(() => employee.addElementoEmpresa(subEmployee), throwsUnimplementedError);
    });

    test('Añadir Departamento a Departamento',(){

      department1.addElementoEmpresa(department2);

      expect(department1.getElementos(), contains(department2));
      expect(department2.getSuperior(), equals(department1));
    });

    test('Añadir Departamento perteneciente a un Departamento a otro',(){
      Departamento childDepartment = Departamento('Child Department', null);

      department1.addElementoEmpresa(childDepartment);
      department2.addElementoEmpresa(childDepartment);

      expect(department1.getElementos(), isNot(contains(childDepartment)));
      expect(department2.getElementos(), contains(childDepartment));
      expect(childDepartment.getSuperior(), equals(department2));
    });




    test('Añadir Empleado perteneciente a un Departamento a otro',(){
      department1.addElementoEmpresa(employee);
      department2.addElementoEmpresa(employee);

      expect(department1.getElementos(), isNot(contains(employee)));
      expect(department2.getElementos(), contains(employee));
      expect(employee.getSuperior(), equals(department2));
    });

    test('Añadir Departamento a Empleado',(){
      expect(() => employee.addElementoEmpresa(department1), throwsUnimplementedError);
    });

    test('Añadir Empleado a Departamento',(){
      department1.addElementoEmpresa(employee);

      expect(department1.getElementos(), contains(employee));
      expect(employee.getSuperior(), equals(department1));
    });


  });

  group('Añadir a Departamento', (){

  });

}