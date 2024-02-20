import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Pages/login/login.dart';
import 'Pages/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: ThemeData.light().copyWith(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            accentColor: Colors.redAccent
            ),
      ),
      initialRoute: '/',

      getPages: [
        GetPage(name: '/', page: () => LoginPage(),),
        GetPage(name: '/register', page: () => RegisterPage(),)
      ],

    );
  }
}

