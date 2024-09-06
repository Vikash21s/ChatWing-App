import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class splacecontroller extends GetxController {
  final auth = FirebaseAuth.instance;

  void onInit() async {
    super.onInit();
    splaceHandle();
  }

  void splaceHandle() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Get.offAllNamed("/homePage");
    print("Hello");
  }
}
