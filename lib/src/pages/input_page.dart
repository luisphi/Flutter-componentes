import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  //String _fecha = "";

  String _opcionSeleccionada = 'Super';

  //SIRVE PARA ASIGNAR UN VALOR DE UNA FUNCION A UN TEXTFIELD
  TextEditingController _textFieldControler = new TextEditingController();

  List<String> _poderes = ['Super', 'No super', 'Mas super', 'Alien'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formularios'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _nombrePersona(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre y apellido',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.insert_emoticon),
        icon: Icon(Icons.person),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _nombrePersona(){
    return ListTile(
      title: Text('El nombre es: ' + _nombre),
    );
  }

  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        hintText: 'Ingrese solo el email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      )
    );
  }

  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        hintText: 'Ingrese solo el password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_open),
      )
    );
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _textFieldControler,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        hintText: 'Fecha nacimiento',
        labelText: 'Fecha nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.date_range),
      ),
      onTap: (){
        //Para deshabilitar el focus de un campo en este caso para sacar la fecha
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000), 
      lastDate: new DateTime(2020),
      locale: Locale('es','ES') 
    );
    if (picked != null){
      setState(() {
        //_fecha = picked.toString();
        _textFieldControler.text = picked.toIso8601String();
      });
    }
  }

  List<DropdownMenuItem<String>> getDropDownOpt (){
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30,),
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: getDropDownOpt(),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );    
  }
}