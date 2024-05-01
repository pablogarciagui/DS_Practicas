
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio_grupal/main.dart';
import 'package:ejercicio_grupal/Model/Empleado.dart';
import 'package:ejercicio_grupal/Model/Departamento.dart';

void main(){

  group('Tests Práctica 3', (){
    test('Añadir empleado a empleado', (){
      Empleado employee = Empleado('John Doe', '12345678A', 'Software Engineer', 'Tiempo Completo', null);
      Empleado subEmployee = Empleado('Jane Doe', '98765432B', 'Software Engineer', 'Tiempo Completo', null);

      expect(() => employee.addElementoEmpresa(subEmployee), throwsUnimplementedError);
    });

    test('Añadir Departamento a Departamento',(){
      Departamento parentDepartment = Departamento('Parent Department', null);
      Departamento childDepartment = Departamento('Child Department', null);

      parentDepartment.addElementoEmpresa(childDepartment);

      expect(parentDepartment.getElementos(), contains(childDepartment));
      expect(childDepartment.getSuperior(), equals(parentDepartment));
    });

    test('Añadir Departamento perteneciente a un Departamento a otro',(){
      Departamento department1 = Departamento('Department 1', null);
      Departamento department2 = Departamento('Department 2', null);
      Departamento childDepartment = Departamento('Child Department', null);

      department1.addElementoEmpresa(childDepartment);
      department2.addElementoEmpresa(childDepartment);

      expect(department1.getElementos(), isNot(contains(childDepartment)));
      expect(department2.getElementos(), contains(childDepartment));
    });

    test('Añadir Empleado perteneciente a un Departamento a otro',(){
      Departamento department1 = Departamento('Department 1', null);
      Departamento department2 = Departamento('Department 2', null);
      Empleado employee = Empleado('Jane Doe', '98765432B', 'Software Engineer', 'Tiempo Completo', null);

      department1.addElementoEmpresa(employee);
      department2.addElementoEmpresa(employee);

      expect(department1.getElementos(), isNot(contains(employee)));
      expect(department2.getElementos(), contains(employee));
    });

    test('Añadir Departamento a Empleado',(){
      Departamento department = Departamento('Department', null);
      Empleado employee = Empleado('Jane Doe', '98765432B', 'Software Engineer', 'Tiempo Completo', null);

      expect(() => employee.addElementoEmpresa(department), throwsUnimplementedError);
    });

    test('Añadir Empleado a Departamento',(){
      Departamento department = Departamento('Department', null);
      Empleado employee = Empleado('John Doe', '12345678A', 'Software Engineer', 'Tiempo Completo', null);

      department.addElementoEmpresa(employee);

      expect(department.getElementos(), contains(employee));
      expect(employee.getSuperior(), equals(department));
    });

  });
}