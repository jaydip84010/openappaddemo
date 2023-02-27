import 'package:flutter/material.dart';
import 'package:openappaddemo/adhelper.dart';
import 'package:openappaddemo/first_screen.dart';

void main() {
  runApp(MaterialApp(
    home: OpenAppAdDemo(),
  ));
}

class OpenAppAdDemo extends StatefulWidget {
  const OpenAppAdDemo({Key? key}) : super(key: key);

  @override
  State<OpenAppAdDemo> createState() => _OpenAppAdDemoState();
}

class _OpenAppAdDemoState extends State<OpenAppAdDemo> {
  adhelper adhelp = adhelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 200,
        width: 200,
        color: Colors.green,
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    adhelp.loadAd();
    Future.delayed(const Duration(seconds: 7), () {
      adhelp.showAdIfAvailable();
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FirstScreen(),
          ),
        );
      });
    });
  }
}
