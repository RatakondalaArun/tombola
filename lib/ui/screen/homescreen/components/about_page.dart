import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

import '../../../../constants/constants.dart' as constants;

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: _onTabName,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'Created by '),
                    TextSpan(
                      text: 'Ratakondala Arun ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: 'with 🧡 '),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: _onTabGithub,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'Source Code is opensourced on '),
                    TextSpan(
                      text: 'Github',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Tombola',
                applicationVersion: '1.0.0',
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: _onTabName,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'Created by '),
                            TextSpan(
                              text: 'Ratakondala Arun ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: 'with 🧡 '),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: _onTabGithub,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'Source Code is opensourced on '),
                            TextSpan(
                              text: 'Github',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  void _onTabName() async {
    if (await urlLauncher.canLaunch(constants.DEVELOPER_GITHUB_PROFILE_URL)) {
      await urlLauncher.launch(
        constants.DEVELOPER_GITHUB_PROFILE_URL,
      );
    }
  }

  void _onTabGithub() async {
    if (await urlLauncher.canLaunch(constants.PROJECT_REPO_URL)) {
      await urlLauncher.launch(
        constants.PROJECT_REPO_URL,
      );
    }
  }
}
