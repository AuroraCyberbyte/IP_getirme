import 'package:cosmos/cosmos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ip = "";
  void getIp() async {
    Dio myDio = Dio();
    var gotIp = await myDio.get("https://api.ipify.org/");
    setState(() {
      ip = gotIp.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'View my IP',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: CosmosBackgroundImage(
          opacity: 0.5,
          image: "assets/wallpaper.jpg",
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    getIp();
                  },
                  child: Text(
                    "View my IP",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 23,
                    ),
                  ),
                ),
                Text(
                  ip,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
