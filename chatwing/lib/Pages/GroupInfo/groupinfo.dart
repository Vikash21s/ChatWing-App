import 'package:chatwing/Config/images.dart';
import 'package:chatwing/Model/groupmodel.dart';
import 'package:chatwing/Pages/HomePage/Widget/chattile.dart';
import 'package:chatwing/Pages/UserProfile/Widgets/userinfo.dart';
import 'package:flutter/material.dart';

class GroupInfo extends StatelessWidget {
  final GroupModel groupModel;
  const GroupInfo({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupModel.name!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            LoginUserInfo(
              profileImage: groupModel.profileUrl == ""
                  ? AssetsImage.defaultProfileUrl
                  : groupModel.profileUrl!,
              userName: groupModel.name!,
              userEmail: groupModel.description ?? "No Description Available",
            ),
            SizedBox(height: 20),
            Text(
              "Members",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 20),
            Column(
              children: groupModel.members!
                  .map(
                    (member) => ChatTile(
                      imageUrl:
                          member.profileImage ?? AssetsImage.defaultProfileUrl,
                      name: member.name!,
                      lastChat: member.email!,
                      lastTime: member.role == "Admin" ? "Admin" : "User",
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
