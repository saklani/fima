import 'package:flutter/widgets.dart';

import 'app.dart';
import '../dashboard/dashboard.dart';
import '../sign_in/sign_in.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [Dashboard.page()];
    case AppStatus.unauthenticated:
      return [SignIn.page()];
  }
}
