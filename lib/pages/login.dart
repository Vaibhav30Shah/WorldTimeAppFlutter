import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SharedPref extends StatelessWidget {
  // final SharedPreferences prefs=SharedPreferences.getInstance() as SharedPreferences;
  // TextEditingController controller=TextEditingController();
  // String setSP='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/loading');
            },
              child: Text('Post'),
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}

