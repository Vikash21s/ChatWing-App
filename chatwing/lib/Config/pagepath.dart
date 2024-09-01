import 'package:chatwing/Pages/Auth/authpage.dart';
import 'package:get/get.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => const Authpage(),
    transition: Transition.zoom, // change page slide
  ),
];
