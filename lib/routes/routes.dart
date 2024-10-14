import 'package:real_estate_test_poc/presentation/bottom_navigation_layout.dart';
import 'package:real_estate_test_poc/presentation/screens/home_screen.dart';
import 'package:real_estate_test_poc/presentation/screens/maps_screen.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: BottomNavigation, initial: true),
  MaterialRoute(page: HomeScreen),
  MaterialRoute(page: MapsScreen),
])
class App {}
