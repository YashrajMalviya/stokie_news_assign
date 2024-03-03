import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stokie/Screens/DashboardScreen.dart';
import 'package:stokie/Utils/MyWidgets/MyWidgets.dart';
import 'package:stokie/Utils/Utils.dart';

// Creating object here so can be used in whole project easily
final Utils utils = Utils();

// Creating object for custom widget class so can be used many times without creating again
final MyWidgets myWidgets = MyWidgets();

final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigatorKey');

// main method will be called first when app run
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ResponsiveSizer will help to make responsive UI
  // GetMaterialApp need because we're using get state management

  @override
  Widget build(BuildContext context) => ResponsiveSizer(
        builder: (buildContext, orientation, screenType) => GetMaterialApp(
          title: 'Stokie',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: kDebugMode,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              textTheme: GoogleFonts.playfairDisplayTextTheme(
                      Theme.of(context).textTheme)
                  .copyWith(
                bodyMedium: GoogleFonts.oswald(
                    textStyle: Theme.of(context).textTheme.bodyMedium),
                displayLarge: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              fontFamily: GoogleFonts.oswald().fontFamily,
              useMaterial3: true,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
                  TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
                },
              ),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white)),
          // default / first widget or screen
          home: const DashboardScreen(),
        ),
      );
}
