import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true, //PARA QUE LA ALERTA SEA COMO POP-UP CERRAR CLIC AFUERA
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text('ES EL TITULO'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[              
              Text('Este es el contenido de la alerta'),
              FlutterLogo(size: 50),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}