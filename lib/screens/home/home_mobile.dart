import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gitspy/screens/result_screen.dart';
import 'package:gitspy/constants.dart'; 
import 'package:gitspy/widgets/social_icon.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key})
      : super(key: key); // Fix the super() call with the correct syntax

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final _usernameController = TextEditingController();
  String resultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  kDefaultPadding), // Use the constant from constants.dart
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    enableFeedback: false,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/moon-light.svg',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              // Add the Expanded widget here
              child: Center(
                child: Container(
                  //color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'GITSPY',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Discover who's up to what!",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        //color: Colors.orange,
                        width: 250,
                        child: Column(
                          children: [
                            TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Enter GitHub username',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  final username = _usernameController.text;
                                  if (username.isEmpty) {
                                    resultMessage = 'Please enter a username';
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultScreen(username: username),
                                      ),
                                    );
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                backgroundColor: kPrimaryColor,
                                minimumSize: const Size(120, 40),
                              ),
                              child: const Text(
                                'Search',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              resultMessage,
                              style: const TextStyle(
                                  fontSize: 18, color: kErrorColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.lightGreen,
              padding: const EdgeInsets.all(5),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Spying? call it social reseach.',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 105, 104, 104))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIcon(imageUrl: 'images/github.svg', linkUrl: 'https://github.com/anaghayawale'),
                      SocialMediaIcon(imageUrl: 'images/instagram.svg', linkUrl: 'https://www.instagram.com/herecomesanagha/'),
                      SocialMediaIcon(imageUrl: 'images/linkedin-in.svg', linkUrl: 'https://www.linkedin.com/in/anagha-yawale/'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
