import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

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
              padding: const EdgeInsets.all(5),
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
                      )), // add dark mode functionality later
                ],
              ),
            ),
            Expanded(
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
                                  borderSide: BorderSide(color: Colors.purple),
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
                                    resultMessage = 'Result: $username';
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                backgroundColor: Colors.purple,
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
                                  fontSize: 18, color: Colors.red),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Spying? call it social reseach.',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 105, 104, 104))),
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
