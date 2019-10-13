import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  //SE INSTANCIA UN OBJETO PARA EL CONTROL DEL SCROLLER
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  //ESTE METODO ES EL PRIMERO EN CARGARSE
  @override
  void initState() {
    super.initState();
    agregar10();
    _scrollController.addListener((){
      //DETERMINAR CUANDO SE LLEGUE AL FINAL DE LA PAGINA DEL CELULAR
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //agregar10();
        fetchData();
      }
    });
  }

  //ESTE METODO SE DISPARA CUANDO SE SALE DE PAGINA
  //Prevenir fugas de memoria
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
      
    );
  }

  Widget _crearLista() {
    //PARA TENER UN LISTADO GRANDE DE INFORMACION
    return RefreshIndicator( //se ubica esto para cuando se carga hacia arriba salga el indicador
        onRefresh: obtenerPagina,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final _imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$_imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      agregar10();
    });    
    return Future.delayed(duration);
  }

  void agregar10(){
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() { });
  }

//METODO PARA CREAR UN DELAY ENTRE CADA TRAIDA DE LA INFORMACION
  Future fetchData() async{
    _isLoading = true;
    setState(() { });

    final duration = new Duration();
    return new Timer(duration, respuestaHttp);
  }

  void respuestaHttp(){
    _isLoading = false;

    //UBICAMOS UNA ANIMACION AL REALIZAR LA CARGA DE LOS DATOS DE ABAJO
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    agregar10();
  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }else{
      return Container();
    }
  }
}