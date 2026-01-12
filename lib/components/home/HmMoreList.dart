import 'package:flutter/material.dart';

class Hmmorelist extends StatefulWidget {
  Hmmorelist({Key? key}) : super(key: key);

  @override
  _HmmorelistState createState() => _HmmorelistState();
}

class _HmmorelistState extends State<Hmmorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          height: 200,
          alignment: Alignment.center,
          child: Text(
            '更多列表$index',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        );
      },
      itemCount: 50,
    );
  }
}
