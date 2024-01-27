

import 'package:flutter/material.dart';
import 'package:my_portfolio/about.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/projects.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "SSM"),
    debugShowCheckedModeBanner: false,
    initialRoute:'home',
       routes :{


      'home': (context)    => MyHome(),
        'about': (context) => MyAbout(),
         'projects': (context) => MyProjects()
    },
  ));
}

