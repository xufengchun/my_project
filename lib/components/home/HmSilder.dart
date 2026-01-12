import 'package:flutter/material.dart';

class Hmsilder extends StatefulWidget {
  Hmsilder({Key? key}) : super(key: key);

  @override
  _HmsilderState createState() => _HmsilderState();
}

class _HmsilderState extends State<Hmsilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.blue,
        height: 200,
        alignment: Alignment.center,
        child: Text(
          '轮播图',
          style: TextStyle(
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
