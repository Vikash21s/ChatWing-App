import 'package:chatwing/Config/pagepath.dart';
import 'package:chatwing/Config/theme.dart';
import 'package:chatwing/Controller/callcontroller.dart';
import 'package:chatwing/Pages/SplacePage/splacepage.dart';
import 'package:chatwing/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CallController callController = Get.put(CallController());
    return GetMaterialApp(
      builder: FToastBuilder(),
      title: 'Flutter Demo',
      theme: lightTheme,
      getPages: pagePath,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const Splacepage(),
    );
  }
}
