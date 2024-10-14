import 'package:cached_network_image/cached_network_image.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_test_poc/constants/constants.dart';
import 'package:real_estate_test_poc/presentation/widgets/card_item.dart';
import 'package:real_estate_test_poc/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double opacity = 0.9;
  bool invisibleContainerVisibility = true;
  bool perfectPlaceVisibility = false;
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
    void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        opacity = opacity == 0.0 ? 0.9 : 0.0;
        perfectPlaceVisibility = true;
      });
    });
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        invisibleContainerVisibility = false;
        perfectPlaceVisibility = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFF9ECDE),
                Color(0xFFF9D8B1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2, 0.4],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and Profile Picture Row
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  children: [
                    Material(
                      elevation: 0.2,
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.location_on, color: Pallete.accentColor),
                            Text(
                              'Saint Petersburg',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Pallete.accentColor),
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(
                            duration: 1500.ms, curve: Curves.easeIn, begin: 0.0)
                        .slide(
                          curve: Curves.easeIn,
                          begin: const Offset(-1.0, 0.0),
                          end: Offset.zero,
                        ),
                    const Spacer(),
                    CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image:
                                NetworkImage('https://via.placeholder.com/56'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 28,
                        foregroundImage: imageProvider,
                      ),
                      imageUrl: profileImg.first,
                      fit: BoxFit.cover,
                    )
                        .animate()
                        .slide(duration: 1500.ms)
                        .scale()
                        .then(delay: const Duration(milliseconds: 100)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Hi, Marina',
                      style:
                          TextStyle(fontSize: 22.5, color: Pallete.accentColor),
                    )
                        .animate()
                        .fadeIn(
                          delay: 2000.ms,
                          duration: 1000.ms,
                          curve: Curves.easeIn,
                          begin: 0.0,
                        )
                        .slideX(begin: 0.0, end: 0.0, delay: 1000.ms),
                        const SizedBox(
                          height: 10,
                        ),
                    Visibility(
                      visible: perfectPlaceVisibility,
                      child: const Text(
                        'let\'s select your \nperfect place',
                        style: TextStyle(
                            fontSize: 30,
                            color: Pallete.secondaryColor,
                            fontWeight: FontWeight.w400),
                      )
                          .animate()
                          .fadeIn(
                            delay: 3000.ms,
                            duration: 2000.ms,
                            curve: Curves.easeIn,
                            begin: 0.0,
                          )
                          .slideY(begin: 1.0, end: 0.0, delay: 1000.ms),
                    ),
                    Visibility(
                      visible: invisibleContainerVisibility,
                      child: AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(seconds: 4),
                        child: Container(
                          width: 250.w,
                          height: 100,
                          color: const Color(0xFFF9ECDE),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              // circular container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      height: 0.21.sh,
                      width: 0.2.sh,
                      decoration: BoxDecoration(
                        color: Pallete.primaryColor.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'BUY',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Countup(
                              begin: 0,
                              end: 1034,
                              duration: const Duration(seconds: 7),
                              separator: ' ',
                              style: textTheme.displayLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'offers',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fade(
                          duration: 2200.ms,
                          delay: 3500.ms,
                        )
                        .scale(delay: 3500.ms),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 0.21.sh,
                      width: 0.2.sh,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'RENT',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Pallete.accentColor,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Countup(
                            begin: 0,
                            end: 2212,
                            duration: const Duration(seconds: 7),
                            separator: ' ',
                            style: textTheme.displayLarge?.copyWith(
                              color: Pallete.accentColor,
                              fontSize: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'offers',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Pallete.accentColor,
                            ),
                          ),
                        ],
                      )),
                    )
                        .animate()
                        .fade(
                          duration: 2200.ms,
                          delay: 3500.ms,
                        )
                        .scale(delay: 3500.ms),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 0.82.sh,
                width: 1.sw,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // top corner with border radius
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: CardItem(
                          width: 1.sw,
                          height: 180.h,
                          imageUrl: cardImages.first,
                          houseName: 'Gladkova St,. 25',
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardItem(
                            width: 0.47.sw,
                            height: 279.h,
                            borderRadius: 20,
                            houseName: 'Gubina St,. 11',
                            margin: const EdgeInsets.only(right: 3),
                            imageUrl: cardImages[2],
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            children: [
                              CardItem(
                                width: 0.47.sw,
                                height: 135.h,
                                borderRadius: 20,
                                houseName: 'Trefoleva St,. 43',
                                margin: const EdgeInsets.only(bottom: 12),
                                imageUrl: cardImages[3],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                houseName: 'Sedova St,. 22',
                                width: 0.47.sw,
                                height: 135.h,
                                borderRadius: 20,
                                margin: const EdgeInsets.only(bottom: 12),
                                imageUrl: cardImages[1],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
                  .animate()
                  .fadeIn(
                      duration: 1500.ms,
                      delay: 5000.ms,
                      curve: Curves.easeIn,
                      begin: 0.0)
                  .slide(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                    curve: Curves.easeIn,
                    delay: 4500.ms,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
