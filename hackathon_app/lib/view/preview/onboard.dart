import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/view/preview/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/constants/app/colors.dart';

class OnboardPreview extends StatefulWidget {
  const OnboardPreview({super.key});

  @override
  State<OnboardPreview> createState() => _OnboardPreviewState();
}

class _OnboardPreviewState extends State<OnboardPreview> {
  final String _login = 'Login';
  final String _skip = 'Skip';
  final String _next = 'Next';
  final int _dotCount = 3;
  final Color _onBoardGradientColor = const Color.fromARGB(60, 78, 115, 223);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundContainer(),
          IntroductionScreen(
            done: Text(_login),
            next: Text(_next),
            skip: Text(_skip),
            onDone: _openLoginScreen,
            onSkip: _openLoginScreen,
            pages: _introductionPages(),
            globalBackgroundColor: colorWhite,
            showSkipButton: true,
            baseBtnStyle: ElevatedButton.styleFrom(
              foregroundColor: colorPrimary,
              textStyle: Theme.of(context).textTheme.headline6,
            ),
            dotsDecorator: _customDotsDecorater(_dotCount),
          ),
        ],
      ),
    );
  }

  DotsDecorator _customDotsDecorater(int length) {
    double dotS = 5; // inactive dot size
    double dotSActive = 7; // active dot size

    List<Size> size = [];

    for (int i = 0; i < length; i++) {
      size.add(_setDotSize(dotS));
    }

    return DotsDecorator(
      color: colorGrey,
      activeColor: colorPrimary,
      sizes: size,
      activeSize: _setDotSize(dotSActive),
    );
  }

  Size _setDotSize(double size) => Size.fromRadius(size);

  void _openLoginScreen() => Get.to(() => const LoginPreview());

  Container _backgroundContainer() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.6, 0.7),
          radius: 0.5,
          colors: <Color>[_onBoardGradientColor, colorWhite],
        ),
      ),
    );
  }

  List<PageViewModel> _introductionPages() {
    final List<String> introImageAddress = [
      'assets/images/svg/intro-1.svg',
      'assets/images/svg/intro-2.svg',
      'assets/images/svg/intro-3.svg',
    ];
    final List<String> introTitles = [
      "Isn't it time to sell products you no longer use?",
      'Swap for another product or sell directly!',
      'Instead of keeping dust on the shelves, the products keep money in your pocket',
    ];

    final List<String> introText = [
      'With BarterBuddy, you can turn your unused products into something for your benefit ',
      "Sell or trade any product at any price with just a few simple clicks! It's so easy with BarterBuddy",
      "You can bid on other people's ads and evalueate the products that hold dust in your hand",
    ];

    return [
      _pageViewModel(introImageAddress[0], introTitles[0], introText[0]),
      _pageViewModel(introImageAddress[1], introTitles[1], introText[1]),
      _pageViewModel(introImageAddress[2], introTitles[2], introText[2]),
    ];
  }

  PageViewModel _pageViewModel(String imageAddress, String title, String text) {
    return PageViewModel(
      image: SvgPicture.asset(
        imageAddress,
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width * 1.25,
        height: 420,
      ),
      title: title,
      body: text,
      decoration: _pageDecoration(),
    );
  }

  PageDecoration _pageDecoration() {
    int imageFlex = 3;
    return PageDecoration(
      imageFlex: imageFlex,
      bodyPadding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 20,
          right: MediaQuery.of(context).size.width / 20),
      bodyTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
            color: colorBlack,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'ABeeZee',
            fontStyle: FontStyle.italic,
          ),
      titlePadding: const EdgeInsets.only(
        bottom: 10,
      ),
      titleTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
          color: colorBlack,
          fontSize: 25,
          fontWeight: FontWeight.w800,
          fontFamily: 'BalooBhaina',
          shadows: <Shadow>[
            const Shadow(
              blurRadius: 4.0,
              color: Color.fromARGB(150, 0, 0, 0),
            )
          ]),
    );
  }
}
