import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  // ignore: sort_constructors_first
  const CreatePostContainer({
    @required this.currentUser,
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
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "What's on your mind?"),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () => print('Live'),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text('Live'),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                    onPressed: () => print('Photo'),
                    icon: const Icon(Icons.photo_library, color: Colors.green),
                    label: const Text('Photo'),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                    onPressed: () => print('Room'),
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: const Text('Room'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
