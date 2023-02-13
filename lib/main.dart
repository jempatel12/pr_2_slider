import 'package:flutter/material.dart';
import 'package:midia_3/screens/global.dart';
import 'package:midia_3/screens/screen_page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home(),
        'screen': (context) => screen(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: Text("Imgae You Like",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),
          ),
          centerTitle: true),
      body: ListView.builder(
          itemCount: Global.all_image.length,
          itemBuilder: (context, i) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Stack(
                  alignment: Alignment(-0.9, 1),
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pushNamed('screen',
                              arguments: Global.all_image[i]);
                        });
                      },
                      child:
                      Image.network("${Global.all_image[i]['image']}"),
                    ),
                    Text(
                      "${Global.all_image[i]['name']}",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          )),
      backgroundColor: Colors.black,
    );
  }
}