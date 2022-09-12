import 'package:dhikr/src/constants/enum_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends StateNotifier<String> {
  PageNotifier() : super(AppRouter.dashboard.name);
  void selectedPage(String page) => state = page;
}

final pageNotifierProvider =
    StateNotifierProvider.autoDispose<PageNotifier, String>((ref) {
  return PageNotifier();
});
