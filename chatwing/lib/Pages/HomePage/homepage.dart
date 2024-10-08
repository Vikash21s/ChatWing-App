import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Config/strings.dart';
import 'package:chatwing/Controller/contactcontroller.dart';
import 'package:chatwing/Controller/imagepicker.dart';
import 'package:chatwing/Controller/profilecontroller.dart';
import 'package:chatwing/Controller/statuscontroller.dart';
import 'package:chatwing/Pages/CallHistory/callhistory.dart';
import 'package:chatwing/Pages/Groups/groupspage.dart';
import 'package:chatwing/Pages/HomePage/Widget/chatlist.dart';
import 'package:chatwing/Pages/HomePage/Widget/tabbar.dart';
import 'package:chatwing/Pages/ProfilePage/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ContactController contactController = Get.put(ContactController());

    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    StatusController statusController = Get.put(StatusController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsImage.semilogo,
            fit: BoxFit.contain, // Adjust the fit property here
            height: 20.0, // Set a specific height
            width: 20.0, // Set a specific width
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              contactController.getChatRoomList();
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              // Get.toNamed("/profilePage");
              Get.to(const ProfilePage());
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(controller: tabController, children: const [
          ChatList(),
          GroupsPage(),
          CallHistory(),
        ]),
      ),
    );
  }
}
