import 'package:flutter_riverpod/legacy.dart';

class NavBarProvider extends StateNotifier<int> {
  NavBarProvider() : super(0);

  void selectPage(int index) {
    state = index;
  }
}

final navBarNotifier = StateNotifierProvider<NavBarProvider, int>((ref) {
  return NavBarProvider();
});
