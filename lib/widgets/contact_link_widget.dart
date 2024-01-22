import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactLinkWidget extends StatelessWidget {
  final String linkUrl;
  final String linkSvgIcon;
  const ContactLinkWidget({
    super.key,
    required this.linkUrl,
    required this.linkSvgIcon,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        final url = Uri.parse(linkUrl);
        try {
          await launchUrl(url);
        } catch (error) {
          if (kDebugMode) {
            print('Could not launch $url');
          }
        }
      },
      child: SvgPicture.asset(
        linkSvgIcon,
        colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurfaceVariant, BlendMode.srcIn),
        width: 40,
      ),
    );
  }
}
