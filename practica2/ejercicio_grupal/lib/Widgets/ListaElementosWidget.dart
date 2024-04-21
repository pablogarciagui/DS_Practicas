import 'package:ejercicio_grupal/Model/Departamento.dart';
import 'package:ejercicio_grupal/Model/director.dart';
import 'package:ejercicio_grupal/Widgets/EmpleadoWidget.dart';
import 'package:ejercicio_grupal/Model/elementoEmpresa.dart';
import 'package:ejercicio_grupal/Model/empleado.dart';
import 'package:flutter/material.dart';


class ListaElementosWidget extends StatefulWidget {
  const ListaElementosWidget({super.key, required this.director, required this.listElems,required this.callback});
  final Director director;
  final List<ElementoEmpresa> listElems;
  final Function callback;

  @override
  State<ListaElementosWidget> createState() => _ListaElementosWidget();
}

class _ListaElementosWidget extends State<ListaElementosWidget> {
  _ListaElementosWidget();

  callback() {
    setState(() {
      widget.callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listElems.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Checkbox(
              onChanged: (bool? value){
                setState(() {
                  widget.director.setElementoSeleccionado(widget.listElems[index]);
                });
                widget.callback();
              },
              value: widget.listElems[index] == widget.director.seleccionado ? true : false,
            ),
            title: Text(widget.listElems[index].toString()),
            subtitle: widget.listElems[index] is Empleado ? EmpleadoWidget(empleado: widget.listElems[index] as Empleado):
            ListaElementosWidget(director: widget.director,listElems:(widget.listElems[index] as Departamento).getElementos(),callback: callback,),

          );
        }
        );
  }
}
