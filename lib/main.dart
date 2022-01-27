import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'frontend/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Vx.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: Home(),
    );
  }
}
