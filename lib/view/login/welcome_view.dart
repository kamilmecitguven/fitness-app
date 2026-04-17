import 'package:fitnessproje/common/colo_extension.dart';
import 'package:fitnessproje/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: media.width * 0.2,
              ),
              Image.asset(
                "assets/img/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Hoşgeldin, Kamil",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Artık hazırsın, hedeflerine beraber ulaşalım!",
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
              const Spacer(),
              RoundButton(
                  title: "Ana Sayfa",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTabView()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
