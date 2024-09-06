import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Config/strings.dart';
import 'package:chatwing/Pages/HomePage/Widget/chatlist.dart';
import 'package:chatwing/Pages/HomePage/Widget/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
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
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("/profilePage");
            },
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(controller: tabController, children: [
          ChatList(),
          ListView(
            children: [
              ListTile(
                title: Text("Name Vikash"),
              )
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text("Name Vikash"),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
