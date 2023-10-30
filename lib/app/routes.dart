import 'package:flutter/widgets.dart';

import '../pages/dashboard/dashboard.dart';
import '../pages/sign_in/sign_in.dart';
import 'app.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [Dashboard.page()];
    case AppStatus.unauthenticated:
      return [SignInView.page()];
  }
}
