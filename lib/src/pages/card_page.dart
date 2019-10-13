import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2(),
          SizedBox(height: 10.0,),
          _cardTipo1(),
          SizedBox(height: 10.0,),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.red,),
            title: Text('Soy el titulo'),
            subtitle: Text('Este es el texto, que debe mostrarse como descripción de la card'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(){
    final _card =  Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://wallpaperplay.com/walls/full/d/3/6/13585.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Descripción de la imagen es esta')
            )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(20.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), //ES PARA HACERLE REDONDEADO
        child: _card,
      ),
    );
  }
}