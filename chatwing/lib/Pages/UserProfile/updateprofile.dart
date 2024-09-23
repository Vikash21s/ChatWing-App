import 'package:chatwing/Widget/primarybutton.dart';
import 'package:flutter/material.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
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
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surface, //yha se image ya dp ka backgroun ka color change kr skte hain
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            size: 40,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Personal Info",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Email id",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          prefixIcon: const Icon(
                            Icons.alternate_email_rounded,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Email id",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: Theme.of(context).textTheme.labelLarge,
                          prefixIcon: const Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40), //button save
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, //change location  //as per requirment
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
