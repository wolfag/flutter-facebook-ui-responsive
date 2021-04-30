import 'package:meta/meta.dart';

import 'story.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;

  // ignore: sort_constructors_first
  const Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}
