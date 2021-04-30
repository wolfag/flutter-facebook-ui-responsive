import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/post.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(
            trackingScrollController: _trackingScrollController,
          ),
          desktop: _HomeScreenDesktop(
            trackingScrollController: _trackingScrollController,
          ),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  // ignore: sort_constructors_first
  const _HomeScreenMobile({
    @required this.trackingScrollController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: trackingScrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30,
              onPressed: () => print('Messenger'),
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: CreatePostContainer(
            currentUser: currentUser,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = posts[index];
              return PostContainer(
                post: post,
              );
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  // ignore: sort_constructors_first
  const _HomeScreenDesktop({
    @required this.trackingScrollController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionsList(
                currentUser: currentUser,
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: trackingScrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(
                  currentUser: currentUser,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ContactsList(
                users: onlineUsers,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
