import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textcontroller = TextEditingController();
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        title: Text('Qr code generator'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Here ',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder()),
              controller: textcontroller,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  data = textcontroller.text;
                  textcontroller.clear();
                });
              },
              child: Text('Generate')),
          SizedBox(
            height: 30,
          ),
          Center(
            child: data != null
                ? QrImageView(
                    data: data!,
                    version: QrVersions.auto,
                    size: 200,
                    gapless: true,
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
