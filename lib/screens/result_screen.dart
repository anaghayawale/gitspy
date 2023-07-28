import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String fullName = '';
  String avatarUrl = '';
  int followersCount = 0;
  int followingCount = 0;
  int starsReceivedCount = 0;
  int forksCount = 0;
  String mostUsedLanguage = '';
  String joinDate = '';
  String location = '';
  String lastUpdate = '';
  List<dynamic> activities = [];

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
    fetchUserData();
    fetchRepositoryData();
    fetchRecentActivities();
  }

  Future<void> fetchUserProfile() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/${widget.username}'),
    );

    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      setState(() {
        fullName = userData['name'] ?? widget.username;
        avatarUrl = userData['avatar_url'] ?? '';
        joinDate = userData['created_at'] ?? '';
        location = userData['location'] ?? '';
        lastUpdate = userData['updated_at'] ?? '';
      });
    } else {
      print('Failed to fetch user profile: ${response.statusCode}');
    }
  }

  Future<void> fetchUserData() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/${widget.username}'),
    );

    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      setState(() {
        followersCount = userData['followers'] ?? 0;
        followingCount = userData['following'] ?? 0;
        starsReceivedCount = userData['public_repos'] ?? 0;
        forksCount = userData['public_gists'] ?? 0;
      });
    } else {
      print('Failed to fetch user data: ${response.statusCode}');
    }
  }

  Future<void> fetchRepositoryData() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/${widget.username}/repos'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> repositories = json.decode(response.body);
      Map<String, int> languageCountMap = {};

      for (var repository in repositories) {
        final language = repository['language'];
        if (language != null) {
          languageCountMap[language] = (languageCountMap[language] ?? 0) + 1;
        }
      }

      if (languageCountMap.isNotEmpty) {
        final sortedLanguages = languageCountMap.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

        setState(() {
          mostUsedLanguage = sortedLanguages.first.key;
        });
      }
    } else {
      print('Failed to fetch repository data: ${response.statusCode}');
    }
  }

  Future<void> fetchRecentActivities() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/${widget.username}/events'),
    );

    if (response.statusCode == 200) {
      setState(() {
        activities = json.decode(response.body);
      });
    } else {
      print('Failed to fetch activities: ${response.statusCode}');
    }
  }

  Future<void> _launchUserProfile() async {
    final url = 'https://github.com/${widget.username}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(avatarUrl),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: _launchUserProfile,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  fullName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                size: 14,
                                color: Colors.purple,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoTile(
                        'Followers',
                        followersCount.toString(),
                      ),
                      _buildInfoTile(
                        'Following',
                        followingCount.toString(),
                      ),
                      _buildInfoTile(
                        'Stars Received',
                        starsReceivedCount.toString(),
                      ),
                      _buildInfoTile(
                        'Forks',
                        forksCount.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Most Used Language: $mostUsedLanguage',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Join Date: $joinDate'),
                  Text('Location: $location'),
                  Text('Last Update: $lastUpdate'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Recent Activities',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return ListTile(
                title: Text(activity['type']),
                subtitle: Text(activity['repo']['name']),
                // Add more details as needed
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
