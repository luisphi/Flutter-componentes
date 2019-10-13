import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listView_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';

Map<String, WidgetBuilder> getRoutes(){
  return<String, WidgetBuilder>{
        '/'       :(BuildContext context) => HomePage(),
        'alert'   :(BuildContext context) => AlertPage(),
        'avatar'  :(BuildContext context) => AvatarPage(),
        'card'    :(BuildContext context) => CardPage(),
        'animated':(BuildContext context) => AnimatedContainerPage(),
        'inputs'  :(BuildContext context) => InputPage(),
        'sliders' :(BuildContext context) => SliderPage(),
        'list'    :(BuildContext context) => ListViewPage()
  };
}