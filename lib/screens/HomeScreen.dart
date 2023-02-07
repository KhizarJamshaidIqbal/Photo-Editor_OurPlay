// ignore_for_file: prefer_const_constructors, file_names, unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:image_editer_tool/screens/Edit_Image_Screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_literals_to_create_immutables
            Padding(
              padding: const EdgeInsets.only(top: 45, right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      StoreRedirect.redirect(
                        androidAppId: "com.devglim.nooraniqaida",
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Icon(
                        Icons.star_border_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        Share.share(
                            "https://play.google.com/store/apps/details?id=com.devglim.nooraniqaida");
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Icon(
                        Icons.share_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                XFile? file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (file != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditeImage(
                        SelectedImage: file.path,
                      ),
                    ),
                  );
                }
              },
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image(
                  image: AssetImage('assets/images/PhotoEdit.png'),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Select Your Favorite Photo",
              style: TextStyle(fontSize: 18, color: Colors.amberAccent),
            ),
            Text(
              "Which Do you Want to Edite it?",
              style: TextStyle(fontSize: 18, color: Colors.amberAccent),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
