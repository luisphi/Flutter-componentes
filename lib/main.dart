import 'package:componentes/src/pages/404_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
 
/// CREAR LA ESTRUCTURA CON=> mateapp

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,

      //CONFIGURACION DE LOCALIZACION E IDIOMAS
      localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
          const Locale('en'), // English
          const Locale('es','ES'), // Espanol
          // ... other locales the app supports
        ],

      //home: HomePage()
      //SE VA A UTILIZAR UN ARCHIVO DE RUTAS 
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => P404Page()
        );
      },
    );
  }
}