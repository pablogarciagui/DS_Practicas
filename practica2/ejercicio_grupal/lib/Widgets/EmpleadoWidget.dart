import 'package:ejercicio_grupal/Model/empleado.dart';
import 'package:flutter/material.dart';


class EmpleadoWidget extends StatelessWidget {
  const EmpleadoWidget({super.key, required this.empleado});
  final Empleado empleado;

  @override
  Widget build(BuildContext context){
    return (
    Container(
        child: Text ("DNI: " + empleado.getDni()+" / Cargo: " + empleado.getCargo()+" / Contrato Actual: " + empleado.getTipoContrato())
    )
    );
  }
}