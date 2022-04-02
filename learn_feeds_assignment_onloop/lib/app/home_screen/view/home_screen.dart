import 'package:flutter/material.dart';
import 'package:learn_feeds_assignment_onloop/app/home_screen/view/feeds_list_view.dart';
import 'package:learn_feeds_assignment_onloop/app/home_screen/view/filter_tag_view.dart';
import 'package:learn_feeds_assignment_onloop/component/ol_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OlAppBar(
        title: "Learn",
        isBookMarkRequired: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 10),
            FilterTagView(),
            FeedsListView()
          ],
        ),
      ),
    );
  }
}
