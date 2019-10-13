import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 200.0;
  bool _bloquear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitchBox(),
            Expanded(
              child: _crearImagen(),              
            ),            
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño Imagen',
      value: _valorSlider,
      //divisions: 20,
      min: 10.0,
      max: 800.0,
      //INCLUIR FUNCION EN MODO LINEA TERNARIA
      onChanged: (_bloquear) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });        
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://media.metrolatam.com/2019/08/09/maxresdefault1-71b4e4d1f7e4302279dac529c3fdeae7.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //   checkColor: Colors.red,
    //   value: _bloquear,
    //   onChanged: (valor){
    //     setState(() {
    //       _bloquear = valor;          
    //     });
    //   },
    // );

    //SEGUNDA FORMA DE IMPLEMENTACION
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquear,
      onChanged: (valor){
        setState(() {
          _bloquear = valor;
        });
      },
    );
  }

  Widget _crearSwitchBox() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquear,
      onChanged: (valor){
        setState(() {
          _bloquear = valor;
        });
      },
    );
  }
}