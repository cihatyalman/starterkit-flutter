import 'dart:io';

import 'package:flutter/material.dart';

import '../screens/color_screen.dart';
import '../screens/home_screen.dart';
import '../screens/app/splash_screen.dart';
import '../screens/app/main_screen.dart';
import '../screens/product/product_details_screen.dart';
import '../screens/product/product_edit_screen.dart';
import '../screens/product/product_list_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/widget/image_widget_screen.dart';
import '../screens/widget/input_widget_screen.dart';
import '../screens/widget/list_widget_screen.dart';
import '../screens/widget/other_widget_screen.dart';
import '../screens/widget/button_widget_screen.dart';
import '../screens/widget/widget_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // #region App Screens
      case SplashScreen.route:
        return _getPageRouteBuilderZero(SplashScreen());
      case MainScreen.route:
        return _getPageRouteBuilderZero(MainScreen(settings: settings));
      // #endregion
      // #region BottomBar Screens
      case HomeScreen.route:
        return _getPageRouteBuilderZero(HomeScreen());
      case WidgetScreen.route:
        return _getPageRouteBuilderZero(WidgetScreen());
      case ColorScreen.route:
        return _getPageRouteBuilderZero(ColorScreen());
      case ProductListScreen.route:
        return _getPageRouteBuilderZero(ProductListScreen());
      case ProfileScreen.route:
        return _getPageRouteBuilderZero(ProfileScreen(settings: settings));
      // #endregion
      // #region Widget - Feature Screens
      case ButtonWidgetScreen.route:
        return _customPageRouteBuilder(ButtonWidgetScreen());
      case InputWidgetScreen.route:
        return _customPageRouteBuilder(InputWidgetScreen());
      case ImageWidgetScreen.route:
        return _customPageRouteBuilder(ImageWidgetScreen());
      case ListWidgetScreen.route:
        return _customPageRouteBuilder(ListWidgetScreen());
      case OtherWidgetScreen.route:
        return _customPageRouteBuilder(OtherWidgetScreen());
      // #endregion
      // #region Product - Feature Screens
      case ProductDetailsScreen.route:
        return _customPageRouteBuilder(
          ProductDetailsScreen(settings: settings),
        );
      case ProductEditScreen.route:
        return _customPageRouteBuilder(ProductEditScreen(settings: settings));
      // #endregion
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text("ERROR")),
          ),
        );
    }
  }

  static PageRoute<dynamic> _customPageRouteBuilder(Widget screen) {
    return Platform.isIOS
        ? _getPageRouteBuilder(screen)
        : _getPageRouteBuilderRight(screen);
  }

  static MaterialPageRoute _getPageRouteBuilder(Widget screen) =>
      MaterialPageRoute(builder: (context) => screen);

  static PageRouteBuilder _getPageRouteBuilderZero(Widget screen) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
      );

  static PageRouteBuilder _getPageRouteBuilderRight(Widget screen) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: screen,
          );
        },
      );

  // static PageRouteBuilder _getPageRouteBuilderBottom(Widget screen) =>
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation, secondaryAnimation) {
  //         const begin = Offset(0, 1);
  //         const end = Offset.zero;
  //         const curve = Curves.ease;

  //         final tween =
  //             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //         return SlideTransition(
  //           position: animation.drive(tween),
  //           child: screen,
  //         );
  //       },
  //     );
}
