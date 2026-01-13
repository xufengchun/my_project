import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/viewmodels/home.dart';

class Hmsilder extends StatefulWidget {
  final List<BannerItem> banners;
  Hmsilder({Key? key, required this.banners}) : super(key: key);

  @override
  _HmsilderState createState() => _HmsilderState();
}

class _HmsilderState extends State<Hmsilder> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  Widget getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width; // 获取屏幕宽度
    return CarouselSlider(
      //轮播图插件使用
      carouselController: _controller,
      items: List.generate(widget.banners.length, (index) {
        return Image.network(
          widget.banners[index].imageUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: 200,
        autoPlay: true,
        enableInfiniteScroll: true,
        viewportFraction: 1,
      ),
    );
  }

  Widget getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 30,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          //color: Colors.black,
          child: Text('搜索', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget getDots() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.banners.length, (index) {
          return GestureDetector(
            onTap: () {
              _controller.animateToPage(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: index == _currentIndex ? 30 : 20,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: index == _currentIndex
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Color.fromRGBO(0, 0, 0, 0.3),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [getSlider(), getSearch(), getDots()]); //轮播图、搜索框、指示器
  }
}
