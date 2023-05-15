import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime object = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await object.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': object.location,
      'flag': object.flag,
      'time': object.time,
      'isDayTime': object.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
