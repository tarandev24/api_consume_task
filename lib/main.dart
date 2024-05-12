import 'package:api_consume_task/screens/geoCodeScreen.dart';
import 'package:api_consume_task/static.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ApiConsumeTaskApplication());
}

class ApiConsumeTaskApplication extends StatelessWidget {
  const ApiConsumeTaskApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Consume Task App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        secondaryHeaderColor: secondaryHeaderColor,
        fontFamily: 'Poppins',
        primaryColor: primaryColor,
        splashColor: Colors.grey,
        canvasColor: subPrimaryColor,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey[500]),
        ),
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      routes: {
        GeographicalCodeScreen.routeName : (context) => const GeographicalCodeScreen()
      },
      initialRoute: GeographicalCodeScreen.routeName,
      
    );
  }
}

