import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/models.dart';
import 'widgets.dart';

class MoreOptionsList extends StatelessWidget {
  final User currentUser;
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events']
  ];

  // ignore: sort_constructors_first
  const MoreOptionsList({
    @required this.currentUser,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: UserCard(
                user: currentUser,
              ),
            );
          }
          final option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _Option(
              icon: option[0],
              color: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  // ignore: sort_constructors_first
  const _Option({
    @required this.icon,
    @required this.color,
    @required this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: color,
          ),
          const SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
