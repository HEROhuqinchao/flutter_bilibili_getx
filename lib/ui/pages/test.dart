import 'package:bilibili_getx/ui/pages/video_play/bilibili_video_player/bilibili_video_player_view.dart';
import 'package:bilibili_getx/ui/widgets/primary_scroll_container.dart';
import 'package:flutter/material.dart';

// GlobalKey<PrimaryScrollContainerState> key1 =
//     GlobalKey<PrimaryScrollContainerState>();
// GlobalKey<PrimaryScrollContainerState> key2 =
//     GlobalKey<PrimaryScrollContainerState>();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BilibiliVideoPlayerComponent();
  }
}

//
// class MyStatelessWidget extends StatefulWidget {
//   const MyStatelessWidget({super.key});
//
//   @override
//   State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
// }
//
// class _MyStatelessWidgetState extends State<MyStatelessWidget> with SingleTickerProviderStateMixin{
//   List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys = [key1, key2];
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.addListener(() {
//       for (int i = 0; i < scrollChildKeys.length; i++) {
//         GlobalKey<PrimaryScrollContainerState> key = scrollChildKeys[i];
//         if (key.currentState != null) {
//           key.currentState?.onPageChange(_tabController.index == i); //控制是否当前显示
//         }
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> tabs = <String>['Tab 1', 'Tab 2'];
//
//     return DefaultTabController(
//       length: 2, // This is the number of tabs.
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 title: const Text('Books'),
//                 // This is the title in the app bar.
//                 pinned: true,
//                 expandedHeight: 150.0,
//                 forceElevated: innerBoxIsScrolled,
//                 bottom: TabBar(
//                   tabs: tabs.map((String name) => Tab(text: name)).toList(),
//                   controller: _tabController,
//                 ),
//               ),
//             ];
//           },
//           body: TabBarView(
//             controller: _tabController,
//             children: [
//               PrimaryScrollContainer(
//                 scrollChildKeys[0],
//                 Page1(),
//               ),
//               PrimaryScrollContainer(
//                 scrollChildKeys[1],
//                 Page2(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page1 extends StatefulWidget {
//   const Page1({Key? key}) : super(key: key);
//
//   @override
//   State<Page1> createState() => Page1State();
// }
//
// class Page1State extends State<Page1> with AutomaticKeepAliveClientMixin{
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Builder(
//         builder: (BuildContext context) {
//           return CustomScrollView(
//             slivers: <Widget>[
//               SliverPadding(
//                 padding: const EdgeInsets.all(8.0),
//                 sliver: SliverFixedExtentList(
//                   itemExtent: 48.0,
//                   delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                       return ListTile(
//                         title: Text('Item $index'),
//                       );
//                     },
//                     childCount: 30,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
//
// class Page2 extends StatefulWidget {
//   const Page2({Key? key}) : super(key: key);
//
//   @override
//   State<Page2> createState() => Page2State();
// }
//
// class Page2State extends State<Page2> with AutomaticKeepAliveClientMixin{
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Builder(
//         builder: (BuildContext context) {
//           return CustomScrollView(
//             slivers: <Widget>[
//               SliverPadding(
//                 padding: const EdgeInsets.all(8.0),
//                 sliver: SliverFixedExtentList(
//                   itemExtent: 48.0,
//                   delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                       return ListTile(
//                         title: Text('child $index'),
//                       );
//                     },
//                     childCount: 50,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }
