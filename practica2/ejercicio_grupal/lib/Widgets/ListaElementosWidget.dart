import 'package:ejercicio_grupal/Model/Director.dart';
import 'package:ejercicio_grupal/Model/Empleado.dart';
import 'package:ejercicio_grupal/Widgets/EmpleadoWidget.dart';
import 'package:ejercicio_grupal/Model/ElementoEmpresa.dart';

import 'package:flutter/material.dart';

class ListaElementosWidget extends StatefulWidget {
  const ListaElementosWidget(
      {super.key,
      required this.director,
      required this.listElems,
      required this.callback});
  final Director director;
  final List<ElementoEmpresa> listElems;
  final Function callback;

  @override
  State<ListaElementosWidget> createState() => _ListaElementosWidget();
}

class _ListaElementosWidget extends State<ListaElementosWidget> {
  _ListaElementosWidget();

  callback() {
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listElems.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: ListTile(
              tileColor:
                  widget.director.puedeTenerHijos(widget.listElems[index])
                      ? (Theme.of(context).primaryColorLight).withOpacity(0.25)
                      : Theme.of(context).canvasColor.withOpacity(0.25),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              leading: Checkbox(
                onChanged: (bool? value) {
                  widget.director
                      .setElementoSeleccionado(widget.listElems[index]);
                  widget.callback();
                },
                value: widget.director.estaSeleccionado(widget.listElems[index])
                    ? true
                    : false,
              ),
              title: Text(widget.listElems[index].toString()),
              subtitle: widget.director.puedeTenerHijos(widget.listElems[index])
                  ? ListaElementosWidget(
                      director: widget.director,
                      listElems: widget.listElems[index].getElementos(),
                      callback: callback,
                    )
                  : EmpleadoWidget(
                      empleado: widget.listElems[index] as Empleado),
            ),
          );
        });
  }
}
