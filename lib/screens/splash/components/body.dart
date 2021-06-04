import 'package:flutter/material.dart';
import 'package:qatar2022/constants.dart';
import 'package:qatar2022/screens/home/home_screen.dart';
import 'package:qatar2022/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to mondial qatar2022 delta App",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "will Qatar 2022 App you will get all what you need ",
      "image": "assets/images/splash_2.png"
    },
    {
      "text":
          "Our aim is for our service users and carers to be partners in everything to mondial qatar",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: splashData.length,
            itemBuilder: (context, index) => SplashContent(
              image: splashData[index]["image"],
              text: splashData[index]['text'],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: <Widget>[
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                Spacer(flex: 3),
                DefaultButton(
                  text: "Get Start",
                  press: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
