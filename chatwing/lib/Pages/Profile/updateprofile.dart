import 'package:chatwing/Widget/primarybutton.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 40,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .background, //yha se image ya dp ka backgroun ka color change kr skte hain
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Personal Info",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Email id",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          prefixIcon: Icon(
                            Icons.alternate_email_rounded,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Email id",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      SizedBox(height: 40), //button save
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, //change location
                        children: [
                          PrimaryButton(
                            btnName: "Save", //button text
                            icon: Icons.save,
                            ontap: () {},
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
