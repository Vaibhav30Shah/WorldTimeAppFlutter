import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';

import 'choose_location.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  Object? parameter;

  @override
  Widget build(BuildContext context) {
    parameter=ModalRoute.of(context)!.settings.arguments;
    data=jsonDecode(jsonEncode(parameter));
    // dynamic data1=Get.arguments;
    // print(data1);
    // Map data=jsonDecode(jsonEncode(data1));

    String bgImg=data['isDay'] ? 'day.jpg' : 'night.jpg';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,400,0,0),
          child: SafeArea(
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async{
                    dynamic result= await Get.to(()=>ChooseLocation());
                    if(result!=null){
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'isDay':result['isDay'],
                          'flag':result['flag']
                        };
                      });
                    }
                  },
                  icon: Icon(Icons.edit_location, color: Colors.white,),
                  label: Text('Edit Location',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 2.0,
                        color: Colors.white
                          ,fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                    data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white
                  ),
                ),
              ElevatedButton(onPressed: (){
                Get.snackbar('Home', 'Welcome to home page', icon: Icon(Icons.home));
              }, child: Text('Click me'))
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}
