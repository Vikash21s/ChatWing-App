import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  //For Login

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed("/homePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false; // change after check...
  }

  Future<void> createUser(String email, String password, String text) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Account Created"); // emoji kese denge..?
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The pasword provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('Th8e account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
