import 'package:bimir_lock/utils/constants.dart';
import 'package:bimir_lock/utils/image_path.dart';
import 'package:bimir_lock/widgets/contact_link_widget.dart';
import 'package:bimir_lock/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';

class BimirLockDrawer extends StatelessWidget {
  const BimirLockDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: theme.colorScheme.surfaceVariant,
                  ),
                  child: FittedBox(
                    child: Icon(
                      Icons.person_rounded,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const DrawerTile(
                iconData: Icons.person_add_alt_rounded,
                title: "Edit User detail",
              ),
              const DrawerTile(
                iconData: Icons.password,
                title: "Change pin",
              ),
              const DrawerTile(
                iconData: Icons.fingerprint,
                title: "Change biometric",
              ),
              const DrawerTile(
                iconData: Icons.mode_edit,
                title: "Dark Mode",
                hasSwitch: true,
              ),
              const Spacer(),
              const Column(
                children: [
                  Text(
                    "Get connected with Creator",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    runSpacing: 10,
                    children: [
                      ContactLinkWidget(
                        linkSvgIcon: ImagePath.linkedinIconPath,
                        linkUrl: ContactLink.linkedinLink,
                      ),
                      ContactLinkWidget(
                        linkSvgIcon: ImagePath.githubIconPath,
                        linkUrl: ContactLink.githubLink,
                      ),
                      ContactLinkWidget(
                        linkSvgIcon: ImagePath.youtubeIconPath,
                        linkUrl: ContactLink.youtubeLink,
                      ),
                      ContactLinkWidget(
                        linkSvgIcon: ImagePath.twitterIconPath,
                        linkUrl: ContactLink.twitterLink,
                      ),
                      ContactLinkWidget(
                        linkSvgIcon: ImagePath.instagramIconPath,
                        linkUrl: ContactLink.instagramLink,
                      ),
                      ContactLinkWidget(
                        linkSvgIcon: ImagePath.facebookIconPath,
                        linkUrl: ContactLink.facebookLink,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
