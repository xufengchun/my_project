import 'package:flutter/material.dart';
import 'package:my_project/components/home/HmCategory.dart';
import 'package:my_project/components/home/HmHot.dart';
import 'package:my_project/components/home/HmMoreList.dart';
import 'package:my_project/components/home/HmSilder.dart';
import 'package:my_project/components/home/HmSuggestion.dart';

class HomeViewState extends StatefulWidget {
  HomeViewState({Key? key}) : super(key: key);

  @override
  __HomeViewStateState createState() => __HomeViewStateState();
}

class __HomeViewStateState extends State<HomeViewState> {
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Hmsilder()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmcategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmsuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(flex: 1, child: Hmhot()),
              SizedBox(width: 10),
              Expanded(flex: 1, child: Hmhot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      Hmmorelist(),

      // Hmsuggestion(),
      // Hmcategory(),
      // Hmhot(),
      // Hmmorelist(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
