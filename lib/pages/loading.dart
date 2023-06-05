import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:get/get.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='loading';
  void setupWorldTime() async{
    WorldTime wt=WorldTime(location: 'Kolkata', flag: 'India.png', url: '/Asia/Kolkata');
    await wt.getTime();
    // Get.to(Home(),arguments: [
    //   {'location':wt.location},
    //   {'flag':wt.flag},
    //   {'time':wt.time},
    //   {'isDay':wt.isDay},
    // ]);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDay':wt.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
        body: Center(
            child: SpinKitFoldingCube(
              color: Colors.white,
              size: 50.0,
            ),
      )
    );
  }
}
