import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/models.dart';
import 'widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  // ignore: sort_constructors_first
  const PostContainer({
    @required this.post,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: isDesktop ? 5 : 0,
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  if (post.imageUrl != null)
                    const SizedBox.shrink()
                  else
                    const SizedBox(
                      height: 6,
                    ),
                ],
              ),
            ),
            if (post.imageUrl != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: CachedNetworkImage(
                  imageUrl: post.imageUrl,
                ),
              )
            else
              const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: _PostStats(
                post: post,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  // ignore: sort_constructors_first
  const _PostHeader({
    @required this.post,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('more'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  // ignore: sort_constructors_first
  const _PostStats({
    @required this.post,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                size: 20,
                color: Colors.grey[600],
              ),
              label: 'Like',
              onTap: () => print('like'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOffOutline,
                size: 20,
                color: Colors.grey[600],
              ),
              label: 'Comment',
              onTap: () => print('comment'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shakerOutline,
                color: Colors.grey[600],
                size: 25,
              ),
              label: 'Share',
              onTap: () => print('share'),
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  // ignore: sort_constructors_first
  const _PostButton({
    @required this.icon,
    @required this.label,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
