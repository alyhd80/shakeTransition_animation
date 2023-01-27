import 'package:flutter/material.dart';
import 'package:transiction_animation/pages/home_page_shake_transitions.dart';
import 'package:transiction_animation/pages/homepage.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage(),transition: Transition.leftToRight),
        GetPage(name: "/shake", page: () => MainShakeTransition(),transition: Transition.rightToLeft,),
      ],    );
  }
}

