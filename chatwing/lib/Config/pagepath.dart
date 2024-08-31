import 'package:chatwing/Pages/Auth/authpage.dart';
import 'package:get/get.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => Authpage(),
    transition: Transition.leftToRight,
  ),
];
