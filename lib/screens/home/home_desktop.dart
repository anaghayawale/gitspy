import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gitspy/constants.dart'; // Import the constants.dart file

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key); // Fix the super() call with the correct syntax

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final _usernameController = TextEditingController();
  String resultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding), // Use the constant from constants.dart
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
            Expanded( // Add the Expanded widget here
              child: Center(
                child: Container(
                  //color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'GITSPY',
                        style: kTitleTextStyle, // Use the constant here
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Discover who's up to what!",
                        style: kSubtitleTextStyle, // Use the constant here
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        //color: Colors.orange,
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'github.com/',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter GitHub username',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                kPrimaryColor), // Use the constant here
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      final username = _usernameController.text;
                                      if (username.isEmpty) {
                                        resultMessage = 'Please enter a username';
                                      } else {
                                        resultMessage = 'Result: $username';
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    backgroundColor:
                                        kPrimaryColor, // Use the constant here
                                    minimumSize: const Size(120, 40),
                                  ),
                                  child: const Text(
                                    'Search',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              resultMessage,
                              style:
                                  kErrorMessageTextStyle, // Use the constant here
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
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Spying? call it social research.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 105, 104, 104),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          //link to facebook
                        },
                        icon: const Icon(Icons.facebook_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          //link to facebook
                        },
                        icon: const Icon(Icons.facebook_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          //link to facebook
                        },
                        icon: const Icon(Icons.facebook_outlined),
                      ),
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
