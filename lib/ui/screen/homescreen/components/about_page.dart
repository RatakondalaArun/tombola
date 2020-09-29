import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

import '../../../../constants/constants.dart' as constants;

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () =>
                  _checkAndLaunchUrl(constants.DEVELOPER_GITHUB_PROFILE_URL),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  children: [
                    TextSpan(text: 'Created by '),
                    TextSpan(
                      text: 'Ratakondala Arun ',
                      style:
                          Theme.of(context).primaryTextTheme.bodyText1.copyWith(
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
              onTap: () => _checkAndLaunchUrl(constants.PROJECT_REPO_URL),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  children: [
                    TextSpan(text: 'Source Code is opensourced on '),
                    TextSpan(
                      text: 'Github',
                      style:
                          Theme.of(context).primaryTextTheme.bodyText1.copyWith(
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
                applicationVersion: '1.0.1',
                applicationIcon: Image.asset(
                  constants.APP_ASSET_ICON_PATH,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => _checkAndLaunchUrl(
                          constants.DEVELOPER_GITHUB_PROFILE_URL),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                          children: [
                            TextSpan(text: 'Created by '),
                            TextSpan(
                              text: 'Ratakondala Arun ',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                            TextSpan(
                              text: 'with 🧡 ',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () =>
                          _checkAndLaunchUrl(constants.PROJECT_REPO_URL),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                          children: [
                            TextSpan(text: 'Source Code is opensourced on '),
                            TextSpan(
                              text: 'Github',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(
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
                  SizedBox(height: 10),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () =>
                          _checkAndLaunchUrl(constants.PROJECT_ISSUES_URL),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                          children: [
                            TextSpan(
                              text:
                                  'All Contributions are Welcomed, you can request a feature or file a issue ',
                            ),
                            TextSpan(
                              text: 'here',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(
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

  // Launches Url
  void _checkAndLaunchUrl(String url) async {
    if (await urlLauncher.canLaunch(url)) {
      await urlLauncher.launch(url);
    }
  }
}
