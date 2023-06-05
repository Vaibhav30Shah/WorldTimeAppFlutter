// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/login.dart';
void main() {
  runApp(GetMaterialApp(

    routes: {
      '/': (context) => SharedPref(),
      '/loading':(context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context) =>ChooseLocation(),
    },
  ));
}

