import 'package:flutter/material.dart';
import 'package:my_project/viewmodels/home.dart';

class Hmcategory extends StatefulWidget {
  //分类列表
  final List<CategoryItem> categories;
  Hmcategory({Key? key, required this.categories}) : super(key: key);

  @override
  _HmcategoryState createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10),
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 241, 245),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    widget.categories[index].picture,
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    widget.categories[index].name,
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
