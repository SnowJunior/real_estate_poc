import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate_test_poc/presentation/screens/home_screen.dart';
import 'package:real_estate_test_poc/theme/theme.dart';
import 'package:real_estate_test_poc/viewmodels/bottom_navigation_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static final List<Widget> _pages = <Widget>[
    Container(),
    Container(),
    const HomeScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewmodel>.reactive(
      viewModelBuilder: () => BottomNavigationViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Pallete.accentGrey,
          resizeToAvoidBottomInset: false,
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Pallete.secondaryColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              onTap: model.onNavItemTapped,
              currentIndex: model.selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Pallete.primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: const Color(0xff9E9E9E),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: model.activeColor(0), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: model.activeColor(1), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.sms,
                      color: Colors.white,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: model.activeColor(2), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: model.activeColor(3), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: model.activeColor(4), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  label: '',
                )
              ],
            ),
          )
              .animate()
              .fadeIn(
                duration: 1000.ms,
                delay: 7800.ms,
                curve: Curves.easeIn,
                begin: 0.0,
              )
              .slideY(begin: 1.0, end: 0.0, delay: 2000.ms),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: _pages.elementAt(
              model.selectedIndex,
            ),
          ),
        );
      },
    );
  }
}
