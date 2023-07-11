import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final bool hasSwitch;
  final IconData iconData;
  final String title;
  const DrawerTile({
    super.key,
    this.hasSwitch = false,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                size: 30,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          // Text(
          //   title,
          //   style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          // ),
          hasSwitch
              ? Transform.scale(
                  alignment: Alignment.topRight,
                  scale: 0.6,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    child: Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: true,
                      onChanged: (value) {},
                      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                )
              : const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
        ],
      ),
    );
  }
}
