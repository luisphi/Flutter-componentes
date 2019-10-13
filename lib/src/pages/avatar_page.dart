import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('LP'),
              backgroundColor: Colors.red,
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage('https://www.infobae.com/new-resizer/_l5sLxSBMXW1Su2V47kjJC7s8T8=/750x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2018/11/12192156/Stan-Lee-19.jpg'),
            radius: 30,
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.nocturnar.com/imagenes/imagenes-bonitas/Imagenes-con-mensajes-chidos-de-amor.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}