import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp')
        ),
        body: ListView(
          children: _crearItems()
        ),
      );
  }

  //FORMA CORTA E IDEAL PARA LA CREACION DE LISTAS
  List<Widget> _crearItems(){

    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Subtitulo de la lista'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }


  //FORMA LARGA DE CREACION DE LISTAS
  List<Widget> _crearItems2(){
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final temp = ListTile(
        title: Text(opt),
      );

      lista..add(temp) // EL .. ES PARA REFERENCIAR AL ITEM ANTERIOR
           ..add(Divider());
    }
    return lista;
  }
}