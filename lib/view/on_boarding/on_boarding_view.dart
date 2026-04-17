import 'dart:ffi';

import 'package:fitnessproje/common_widget/on_boarding_page.dart';
import 'package:fitnessproje/view/login/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../common/colo_extension.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Hedefini Seç",
      "subtitle":
          "Hedeflerinizi belirlemede sorun yaşıyorsanız endişelenmeyin, hedeflerinizi belirlemenize ve hedeflerinize ulaşmanıza yardımcı olabiliriz.",
      "image": "assets/img/on_1.png"
    },
    {
      "title": "Acıyı Hisset",
      "subtitle":
          "Çalışmak sadece geçici olarak acı verir, şimdi pes edersen sonsuza kadar acı çekersin.",
      "image": "assets/img/on_2.png"
    },
    {
      "title": "Düzgün Beslen",
      "subtitle":
          "Sağlıklı bir yaşam tarzına bizimle başlayabilirsiniz.Sağlıklı beslenmek eğlencelidir.",
      "image": "assets/img/on_3.png"
    },
    {
      "title": "Uyku Kaliteni Arttır",
      "subtitle": "Kaliteli uyku sabahları iyi bir ruh hali getirir.",
      "image": "assets/img/on_4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var p0bj = pageArr[index] as Map? ?? {};
                return OnBoardingPage(p0bj: p0bj);
              }),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: TColor.primaryColor1,
                        borderRadius: BorderRadius.circular(35)),
                    child: IconButton(
                        icon: Icon(
                          Icons.navigate_next,
                          color: TColor.white,
                        ),
                        onPressed: () {
                          if (selectPage < 3) {
                            selectPage = selectPage + 1;
                            controller.animateToPage(selectPage,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceInOut);
//                            controller.jumpToPage(selectPage);
                            setState(() {});
                          } else {
                            print("Giriş Ekranını Aç");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpView()));
                          }
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
