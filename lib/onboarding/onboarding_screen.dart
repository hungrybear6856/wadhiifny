import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wadhiifny/model/modelOnbording.dart';
import 'package:wadhiifny/view/loginscreen.dart';

class onboardingScreen extends StatefulWidget {
  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  var lastpage = false;

  var BoardingPageController = PageController();

  List<BoardingModel> modelboarding = [
    BoardingModel(
        title: 'fing job now',
        subtitle: 'blude your creaerr',
        image: 'assets\image\onetil.jpg'),
    BoardingModel(
        title: 'fing job nowww',
        subtitle: 'blude your creaerrr',
        image: 'assets\image\onetil.jpg'),
    BoardingModel(
        title: 'fing job nowwwwwww',
        subtitle: 'blude your creaerrrrrrr',
        image: 'assets\image\onetil.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  print(value);

                  if (value == modelboarding.length - 1) {
                    lastpage = true;
                  } else {
                    lastpage = false;
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: BoardingPageController,
                itemBuilder: (context, index) {
                  return buildBoardingItem(modelboarding[index]);
                },
                itemCount: modelboarding.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        activeDotColor: Colors.orange,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5.0),
                    controller: BoardingPageController,
                    count: modelboarding.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (lastpage) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return logingScreen();
                        },
                      ));
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return logingScreen();
                        },
                      ), (route) => false);
                    } else {
                      BoardingPageController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.arrow_forward,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel b) {
    return Column(
      children: [
        Expanded(child: Image(image: AssetImage('assets/image/onetil.jpg'))),
        SizedBox(
          height: 20,
        ),
        Text(
          b.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          b.subtitle,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
