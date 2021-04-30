import 'package:flutter/material.dart';

import '../models/models.dart';
import 'profile_avatar.dart';

class UserCard extends StatelessWidget {
  final User user;

  // ignore: sort_constructors_first
  const UserCard({
    @required this.user,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
