import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],  //SE DEBE UBICAR PARA EVITAR ERROR DE LISTA NULA ANTES DE QUE CARGUE EL FUTURE
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {    
    final List<Widget> opciones = [];

    data.forEach((opt){
      final temp = ListTile(
        title: Text(opt["texto"]),
        leading: getIcon(opt["icon"]),  //getIcon es una función en utils
        trailing: Icon(Icons.arrow_right, color: Colors.red,),
        onTap: (){

          Navigator.pushNamed(context, opt['ruta']);

          /*  ES LA FORMA NORMAL DE NAVEGACION, SI NO ESTA EN UNA LISTA
          final route = MaterialPageRoute(
            builder: (context) => AlertPage()
          );
          Navigator.push(context, route); */

        },
      );
      opciones..add(temp)
              ..add(Divider());
    });

    return opciones;
  }
}