import 'package:fitnessproje/common/colo_extension.dart';
import 'package:fitnessproje/common_widget/round_button.dart';
import 'package:fitnessproje/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "Fitness",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Herkes Antrenman Yapabilir",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: RoundButton(
                    title: "Hadi Başlayalım",
                    type: isChangeColor
                        ? RoundButtonType.textGradient
                        : RoundButtonType.bgGradient,
                    onPressed: () {
                      if (isChangeColor) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBoardingView()));
                      } else {
                        setState(() {
                          isChangeColor = true;
                        });
                      }
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
