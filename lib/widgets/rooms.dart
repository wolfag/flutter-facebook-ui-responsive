import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/story.dart';
import 'widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  // ignore: sort_constructors_first
  const Rooms({
    @required this.onlineUsers,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 4,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: _CreateRoomButton(),
              );
            }
            final user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create room'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 3,
          color: Colors.blueAccent[100],
        ),
        textStyle: const TextStyle(
          color: Palette.facebookBlue,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Icon(
            Icons.video_call,
            size: 35,
            color: Colors.purple,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text('Create\nRoom')
        ],
      ),
    );
  }
}
