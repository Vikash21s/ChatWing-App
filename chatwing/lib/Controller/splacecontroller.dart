import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class splacecontroller extends GetxController {
  final auth = FirebaseAuth.instance;

  void onInt() async {
    super.onInit();
    await splaceHandle();
  }

  Future<void> splaceHandle() async {
    Future.delayed(
      Duration(seconds: 3),
    );
    Get.offAllNamed("/homePage");
  }
}
