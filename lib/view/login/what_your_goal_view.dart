import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnessproje/common/colo_extension.dart';
import 'package:fitnessproje/view/login/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common_widget/round_button.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselController buttonCarouselController = CarouselController();

  List goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Şekil Kazan",
      "subtitle": "Vücut yağım az ve daha \nfazla kas geliştirmem \ngerekiyor"
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Kütle Kazan",
      "subtitle":
          "Zayıfım, ince ve şekilsiz \ngörünüyorum. Kas kütlesi \nkazanmam gerekiyor."
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Yağ Kaybet",
      "subtitle":
          "Yağ oranım yüksek, yağlarımdan \nkurtulup kas kazanmam \ngerekiyor"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items: goalArr
                  .map(
                    (gObj) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: TColor.primaryG,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: media.width * 0.1, horizontal: 25),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              gObj["image"].toString(),
                              width: media.width * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: media.width * 0.1,
                            ),
                            Text(
                              gObj["title"].toString(),
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: media.width * 0.1,
                              height: 1,
                              color: TColor.white,
                            ),
                            SizedBox(
                              height: media.width * 0.02,
                            ),
                            Text(
                              gObj["subtitle"].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                aspectRatio: 0.74,
                initialPage: 0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Hedefin Ne?",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Senin için en iyi programı\n seçmemize yardımcı ol",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                const Spacer(),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundButton(
                    title: "Tamamla",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeView()));
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}
