import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeSearchingScreen extends StatelessWidget {
  const HomeSearchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 50.h,
                viewportFraction: 0.8,
                autoPlay: true,
              ),
              items: [
                SvgPicture.asset('assets/svg/baseball.svg'),
                SvgPicture.asset('assets/svg/tenis.svg'),
                SvgPicture.asset('assets/svg/futbol.svg'),
                SvgPicture.asset('assets/svg/golf.svg'),
                SvgPicture.asset('assets/svg/basketball.svg'),
              ],
            ),
            Text(
              'We are serching games near you!',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              color: context.theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
