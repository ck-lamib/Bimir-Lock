import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
              SizedBox(
                height: 10,
              ),
              DrawerTile(),
              DrawerTile(),
              DrawerTile(),
              Wrap(
                spacing: 20,
                alignment: WrapAlignment.center,
                runSpacing: 10,
                children: [
                  InkWell(
                    onTap: () async {
                      final url = Uri.parse("https://bg.linkedin.com/in/ck-lamib/");
                      try {
                        await launchUrl(url);
                      } catch (error) {
                        print(error);
                        if (kDebugMode) {
                          print('Could not launch $url');
                        }
                      }
                    },
                    child: SvgPicture.asset(
                      "assets/Icons/linkedin.svg",
                      width: 40,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/Icons/github.svg",
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/Icons/instagram.svg",
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/Icons/facebook.svg",
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/Icons/github.svg",
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/Icons/instagram.svg",
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/Icons/facebook.svg",
                    width: 40,
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

class DrawerTile extends StatelessWidget {
  final bool hasSwitch;
  const DrawerTile({
    super.key,
    this.hasSwitch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.home,
                size: 25,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "User Setting",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          hasSwitch
              ? Transform.scale(
                  scale: 0.6,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                )
              : Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
        ],
      ),
    );
  }
}
