import 'package:chatwing/Pages/Auth/authpage.dart';
import 'package:chatwing/Pages/Chat/ChatPage.dart';
import 'package:chatwing/Pages/HomePage/homepage.dart';
import 'package:chatwing/Pages/Profile/profilepage.dart';
import 'package:get/get.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => const Authpage(),
    transition: Transition.zoom, // change page slide
  ),
  GetPage(
    name: "/homePage",
    page: () => const Homepage(),
    transition: Transition.zoom, // change page slide
  ),
  GetPage(
    name: "/chatPage",
    page: () => const ChatPage(),
    transition: Transition.zoom, // change page slide
  ),
  GetPage(
    name: "/profilePage",
    page: () => ProfilePage(),
    transition: Transition.zoom, // change page slide
  ),
];
