import 'package:chaussure/authentication/connexion_page.dart';
import 'package:chaussure/authentication/services/auth_services.dart';
import 'package:chaussure/data/dummy_data.dart';
import 'package:chaussure/models/models.dart';
import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:chaussure/utils/constants.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  // ************
  int statusCurrentIndex = 0;
  AuthClass authClass = AuthClass();
  // ************
  @override
  Widget build(BuildContext context) {
    // ****************
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // ****************
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "My Profile",
              style: AppThemes.profileAppBarTitle,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 5),
              child: IconButton(
                onPressed: () async {
                  await authClass.logout();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConnexionPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.logout,
                  color: AppConstantsColor.darkTextColor,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: Column(
              children: [
                _userInfo(),
                const SizedBox(height: 30),
                _userStatusListView(height, width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _userStatusListView(double height, double width) {
    return SizedBox(
      height: height * 0.12,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Status",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          SizedBox(
            width: width,
            height: height * 0.08,
            // color: Colors.red,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: userStatus.length,
                itemBuilder: (context, index) {
                  UserStatus status = userStatus[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        statusCurrentIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 120,
                      decoration: BoxDecoration(
                        color: statusCurrentIndex == index
                            ? status.selecteColor
                            : status.unSelecteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            status.emoji,
                            size: 30,
                            color: Colors.indigo,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            status.text,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppConstantsColor.darkTextColor,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Row _userInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/user.jpg"),
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohamed Cisse",
              style: AppThemes.profileDevName,
            ),
            Text(
              "Dveloppeur Web/Mobile",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            )
          ],
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit_outlined,
            size: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
